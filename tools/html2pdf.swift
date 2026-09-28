import AppKit
import WebKit
import PDFKit

// Builds Julia's two-page A4 CV PDF from cv-print.html with the Mac's own WebKit (no extra software).
// Build: swiftc -sdk /Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk tools/html2pdf.swift -o /tmp/html2pdf
// Run (with the local server on :8000): /tmp/html2pdf http://localhost:8000/cv-print.html ~/Downloads/Julia_Artemova_CV_2026.pdf /tmp/cv-page
// Loads the page at 595px wide, waits for fonts and images, prints how much each page overflows (all zeros = fits),
// then prints each 595×842 .page to one A4 PDF page (text stays text, links stay clickable)
// and writes PNG previews (<preview-prefix>1.png, 2.png) to check the layout.
let a = CommandLine.arguments
let url = URL(string: a[1])!, out = a[2], prefix = a[3]
let W: CGFloat = 595, H: CGFloat = 842

class D: NSObject, WKNavigationDelegate {
  func webView(_ v: WKWebView, didFinish n: WKNavigation!) {
    let js = """
    document.body.classList.add('render');
    await document.fonts.ready;
    await Promise.all([...document.images].map(i => i.complete ? 0 : new Promise(r => { i.onload = i.onerror = r; })));
    const pages = [...document.querySelectorAll('.page')];
    return JSON.stringify({ count: pages.length, height: document.documentElement.scrollHeight,
      fonts: [...document.fonts].filter(f => f.status === 'loaded').map(f => f.family + ' ' + f.style + ' ' + f.weight),
      overflow: pages.map((p, i) => { const cols = p.querySelector('.cols'); const kids = [...p.querySelectorAll('.cols > *')];
        return { page: i + 1, pageOverflow: p.scrollHeight - p.clientHeight,
                 columns: kids.map(k => Math.round(k.scrollHeight - cols.clientHeight)) }; }) });
    """
    v.callAsyncJavaScript(js, arguments: [:], in: nil, in: .page) { res in
      switch res {
      case .failure(let e): print("js error", e); exit(1)
      case .success(let r): print(r as? String ?? "")
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { self.render(v, page: 0, doc: PDFDocument()) }
    }
  }
  func render(_ v: WKWebView, page: Int, doc: PDFDocument) {
    if page == 2 {
      doc.documentAttributes = [PDFDocumentAttribute.titleAttribute: "Julia Artemova — CV", PDFDocumentAttribute.authorAttribute: "Julia Artemova",
                               PDFDocumentAttribute.subjectAttribute: "Senior Creative & Graphic Designer / Art Director", PDFDocumentAttribute.creatorAttribute: "artemovadesign.com"]
      doc.write(to: URL(fileURLWithPath: out))
      for i in 0..<doc.pageCount {
        let p = doc.page(at: i)!
        print("page", i + 1, "size pt:", p.bounds(for: .mediaBox).size, "links:", p.annotations.compactMap { $0.url?.absoluteString })
        let img = p.thumbnail(of: NSSize(width: W * 2, height: H * 2), for: .mediaBox)
        let rep = NSBitmapImageRep(data: img.tiffRepresentation!)!
        try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: "\(prefix)\(i + 1).png"))
      }
      print("wrote", out); exit(0)
    }
    let cfg = WKPDFConfiguration(); cfg.rect = CGRect(x: 0, y: CGFloat(page) * H, width: W, height: H)
    v.createPDF(configuration: cfg) { res in
      switch res {
      case .failure(let e): print("pdf error", e); exit(1)
      case .success(let data):
        let one = PDFDocument(data: data)!
        doc.insert(one.page(at: 0)!, at: doc.pageCount)
        self.render(v, page: page + 1, doc: doc)
      }
    }
  }
}
let app = NSApplication.shared
let win = NSWindow(contentRect: NSRect(x: 0, y: 0, width: W, height: H * 2), styleMask: [.borderless], backing: .buffered, defer: false)
let v = WKWebView(frame: NSRect(x: 0, y: 0, width: W, height: H * 2))
win.contentView = v
let d = D(); v.navigationDelegate = d
v.load(URLRequest(url: url))
DispatchQueue.main.asyncAfter(deadline: .now() + 60) { print("timeout"); exit(2) }
app.run()
