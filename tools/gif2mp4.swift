import Foundation
import AVFoundation
import ImageIO
import CoreVideo

// usage: gif2mp4 in.gif out.mp4 bitrate poster.jpg
let a = CommandLine.arguments
let src = CGImageSourceCreateWithURL(URL(fileURLWithPath: a[1]) as CFURL, nil)!
let n = CGImageSourceGetCount(src)
let first = CGImageSourceCreateImageAtIndex(src, 0, nil)!
let w = first.width & ~1, h = first.height & ~1

func delay(_ i: Int) -> Double {
  let p = CGImageSourceCopyPropertiesAtIndex(src, i, nil) as? [CFString: Any]
  let g = p?[kCGImagePropertyGIFDictionary] as? [CFString: Any]
  var d = (g?[kCGImagePropertyGIFUnclampedDelayTime] as? Double) ?? 0
  if d <= 0.011 { d = (g?[kCGImagePropertyGIFDelayTime] as? Double) ?? 0.1 }
  return d < 0.02 ? 0.1 : d   // browsers treat tiny delays as 100 ms
}

let out = URL(fileURLWithPath: a[2])
try? FileManager.default.removeItem(at: out)
let writer = try! AVAssetWriter(outputURL: out, fileType: .mp4)
writer.shouldOptimizeForNetworkUse = true
let input = AVAssetWriterInput(mediaType: .video, outputSettings: [
  AVVideoCodecKey: AVVideoCodecType.h264,
  AVVideoWidthKey: w, AVVideoHeightKey: h,
  AVVideoCompressionPropertiesKey: [
    AVVideoAverageBitRateKey: Int(a[3])!,
    AVVideoProfileLevelKey: AVVideoProfileLevelH264HighAutoLevel,
    AVVideoMaxKeyFrameIntervalDurationKey: 2.0,
  ],
])
input.expectsMediaDataInRealTime = false
let adaptor = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: input, sourcePixelBufferAttributes: [
  kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA,
  kCVPixelBufferWidthKey as String: w, kCVPixelBufferHeightKey as String: h,
])
writer.add(input)
writer.startWriting()
writer.startSession(atSourceTime: .zero)

// Persistent canvas so partial GIF frames composite like they do in a browser.
let cs = CGColorSpaceCreateDeviceRGB()
let canvas = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: 0, space: cs,
                       bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)!
canvas.setFillColor(CGColor(red: 0, green: 0, blue: 0, alpha: 1))
canvas.fill(CGRect(x: 0, y: 0, width: w, height: h))

var t = 0.0
for i in 0..<n {
  let img = CGImageSourceCreateImageAtIndex(src, i, nil)!
  canvas.draw(img, in: CGRect(x: 0, y: h - img.height, width: img.width, height: img.height))
  if i == 0, a.count > 4, let frame = canvas.makeImage() {
    let dest = CGImageDestinationCreateWithURL(URL(fileURLWithPath: a[4]) as CFURL, "public.jpeg" as CFString, 1, nil)!
    CGImageDestinationAddImage(dest, frame, [kCGImageDestinationLossyCompressionQuality: 0.8] as CFDictionary)
    CGImageDestinationFinalize(dest)
  }
  var pb: CVPixelBuffer?
  CVPixelBufferPoolCreatePixelBuffer(nil, adaptor.pixelBufferPool!, &pb)
  CVPixelBufferLockBaseAddress(pb!, [])
  let ctx = CGContext(data: CVPixelBufferGetBaseAddress(pb!), width: w, height: h, bitsPerComponent: 8,
                      bytesPerRow: CVPixelBufferGetBytesPerRow(pb!), space: cs,
                      bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue | CGBitmapInfo.byteOrder32Little.rawValue)!
  ctx.draw(canvas.makeImage()!, in: CGRect(x: 0, y: 0, width: w, height: h))
  CVPixelBufferUnlockBaseAddress(pb!, [])
  while !input.isReadyForMoreMediaData { usleep(1000) }
  adaptor.append(pb!, withPresentationTime: CMTime(seconds: t, preferredTimescale: 6000))
  t += delay(i)
}
input.markAsFinished()
writer.endSession(atSourceTime: CMTime(seconds: t, preferredTimescale: 6000))
let sem = DispatchSemaphore(value: 0)
writer.finishWriting { sem.signal() }
sem.wait()
if writer.status != .completed { print("FAILED", writer.error ?? ""); exit(1) }
print("\(n) frames, \(String(format: "%.1f", t)) s, \(w)x\(h)")
