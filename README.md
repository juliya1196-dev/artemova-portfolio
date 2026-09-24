# Julia Artemova — Portfolio Site

One-page portfolio for **Julia Artemova**, Senior Graphic & Packaging Designer (Food Tech / Retail / Publishing), based in Amsterdam.

Plain HTML + CSS + a few lines of JS. No framework, no build step: open `index.html` in a browser and it works.

- Content source: Julia's CV (`~/Downloads/CV_Artemova (1).pdf`)
- Style reference: https://victorinesnijders.com/ (dark, image-led project grid, floating nav)

## Where things live

| What | Where |
|---|---|
| Local files | `~/artemova-portfolio` (git clone of the repo) |
| GitHub repo | https://github.com/juliya1196-dev/artemova-portfolio (branch `main`) |
| Claude preview (private) | https://claude.ai/artifact/SLw4XN7WY7JYgnxHEEiDw2 |
| Live site | https://juliya1196-dev.github.io/artemova-portfolio/ (GitHub Pages, deploys automatically from `main` a minute or two after each push) |
| Local preview | http://localhost:8000 — `python3 -m http.server 8000` in the project folder, or the `site` entry in `.claude/launch.json` for Claude's browser pane |

This Mac has Apple's Command Line Tools (git), Homebrew and GitHub CLI (`gh`, logged in as `juliya1196-dev`). Updates go to GitHub with `git commit` + `git push`; no more uploading files by hand. Commits use the GitHub no-reply email so Julia's address stays out of the public history.

## Files

| File | Purpose |
|---|---|
| `index.html` | **The site.** Source of truth; this is what goes to GitHub. |
| `projects/starbucks-peanuts.html` | Case-study page for the Starbucks × Peanuts tile (opens in a new tab). |
| `projects/disney-drinkware.html` | Case-study page for the Disney tile (opens in a new tab). Structure, text and images come from Julia's Notion page; the text is word for word. No link back to Notion on case-study pages (Julia's request). |
| `projects/dodo-pizza-uk.html` | Case-study page for the Dodo Pizza UK tile (opens in a new tab). Built from Julia's Notion page the same way as Disney. |
| `projects/dodo-pizza-uk/` | The 8 images for the Dodo Pizza UK case study, from that Notion page. Its cover is `project-dodo-pizza-uk.jpg`. |
| `projects/presentations.html` | Case-study page for the Presentations tile (opens in a new tab). Built from Julia's Notion page like the others: the process steps (1, 2, 3, 5 — Notion skips 4) with three event decks in between, then the Alfa Bank pitch. Includes a YouTube embed (youtube-nocookie) of the 14th Dodo Pizza Partners Congress. |
| `projects/presentations/` | 13 images and 9 slide animations for that page. The animations were GIFs in Notion (47 MB); they're MP4s here (12 MB) with a first-frame `.jpg` poster each. They load only when scrolled near and pause off-screen. Cover is `project-presentations.webp`, which replaces Notion's first (Russian) stage photo. |
| `tools/gif2mp4.swift` | Converts a GIF to an H.264 MP4 plus a poster JPEG with Apple's built-in frameworks (no ffmpeg needed). Build: `swiftc -O -sdk /Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk tools/gif2mp4.swift -o /tmp/gif2mp4` (the newest SDK doesn't match this Mac's Swift compiler). Run: `/tmp/gif2mp4 in.gif out.mp4 2500000 poster.jpg`. |
| `projects/disney/` | The 7 images for the Disney case study, downloaded from that Notion page. Its cover is `project-disney.jpg`. |
| `julia-photo.png` | Portrait, cropped from the CV PDF (only 280×300; a sharper original would help). |
| `showreel.mp4` | Hero showreel for screens wider than 700px. 1920×1080, 14.7 s, 15.4 MB, H.264 (Julia's "Comp 3.mp4", re-encoded with macOS `avconvert -p Preset1920x1080` from 27.7 MB). |
| `showreel-small.mp4` | Same showreel for phones (≤700px): the earlier 848×480, 2.9 MB Telegram export. |
| `project-starbucks-peanuts.webp` | Cover: Starbucks × Peanuts |
| `project-disney.jpg` | Cover: Disney drinkware |
| `project-dodo-pizza-uk.jpg` | Cover: Dodo Pizza UK |
| `project-presentations.webp` | Cover: Presentation & Pitch Decks |
| `portfolio.html` | Copy of `index.html` for the Claude preview only. Local file, listed in `.gitignore` so it never goes to GitHub. |

`portfolio.html` is `index.html` without the page wrapper lines (`<!doctype>`, `<html>`, `<head>`, `<meta charset>`, `<meta viewport>`, `</head>`, `<body>`, `</body>`, `</html>`), because the Claude preview adds its own. Edit `index.html`, then regenerate `portfolio.html` from it only if the preview needs updating.

## Page structure (top to bottom)

0. **Loader**: full-screen dark overlay with Julia's orange "art" logo rising letter by letter, a thin orange progress line and a percentage. It waits for the fonts and the first 4 seconds of the showreel (at least 1.3 s so the animation plays, at most 6 s), then slides up like a curtain and the showreel starts from the beginning. With reduced motion it simply fades. It only exists when JavaScript runs (`html.js`), and a timer lifts it even in a background tab.
1. **Bottom dock nav**: fixed, centered, white rounded rectangle. Julia's orange logo (SVG inlined), then Projects · About · Contacts · CV. "CV" links to her Notion portfolio.
   - **Back to top**: white pill in the top-left corner (same look as the dock) with an up arrow. Appears once the page is scrolled more than two screen heights, links to `#top`, scrolls smoothly (instantly with reduced motion).
2. **Hero** (`#hero`): the showreel video at full width (`showreel-small.mp4` on phones, `showreel.mp4` elsewhere, picked by `<source media>`), autoplaying, muted and looping. It keeps its own 16:9 shape instead of filling the screen height, because the collage runs to the left and right edges and cropping would cut those images off. Black background to match the video. If the browser paused it in a background tab, it restarts when the tab becomes visible.
3. **Projects** (`#work`): 2-column grid, 20px side padding and 20px gaps, square corners, no borders. Each tile is a full-bleed image with a dark overlay and the title centered.
   1. Starbucks × Peanuts (Global Collaboration). Links to its case-study page.
   2. Disney (Drinkware Design). Links to its case-study page.
   3. Art Directing Visual Style of Dodo Pizza UK (Art Direction). Links to its case-study page.
   4. Presentation & Pitch Decks Design (Corporate Communications). Links to its case-study page.
   5. BBDO (Automotive Campaign). Placeholder, no cover yet.
   6. Skylark Learning (Digital Product Design). Placeholder, no cover yet.
4. **About** (`#about`): photo on the left, "9+ Years" and "8+ Core Disciplines" blocks on the right. Below them, "Hi, I'm Julia." and the bio paragraph.
5. **Capabilities** (`#capabilities`): 5 rows (Package Design, Brand & Identity, Art Direction, Print Production, Digital & Content).
6. **Toolkit** (`#toolkit`): Tools & Tech pills, plus Education and People of Print membership cards.
7. **Contact** (`#contact`): email button, LinkedIn button, location and status, freelance clients note.
8. **Footer**: © 2026 line.

Sections slide up and fade in as they scroll into view (`data-reveal` on each `<section>` plus an IntersectionObserver), and scrolling snaps gently to section starts. Both switch off for people who have reduced motion turned on; for them the showreel also starts paused, with play controls.

## Design system

- **Dark theme only**: near-black background `#121010`, warm off-white text `#F5EFE3`, accent orange `#FF6B3D`. The logo orange is `#ff4b27`. All colors are CSS variables at the top of `index.html`.
- **Fonts** (Google Fonts): Fraunces (headings), JetBrains Mono (labels, nav), Archivo (body text).
- **Dock**: white background with dark text; the CV link is dark orange `#B8390F` for contrast.

## Julia's decisions (don't undo without asking)

- No top header. The bottom dock is the only navigation.
- Project tiles have no rounded corners and no outline. The image fills the tile and the name is centered.
- The bio is Julia's CV intro, word for word. Don't rewrite it.
- Removed on purpose: hero headline and text, top info strip, scrolling client ticker, "Selected Work" heading, Experience timeline, the "About" label and icon, phone number, and the "Full Portfolio" link in Contact.
- Case-study pages are built from Julia's Notion pages: same structure and images, text word for word, no link back to Notion. The tile becomes a link with `target="_blank"`.
- Missing images get an honest placeholder ("Cover coming soon"), never a stand-in picture.

## Open to-dos

- [x] Showreel video for the hero.
- [x] Sharper showreel (1920×1080).
- [ ] Lighter showreel. `showreel.mp4` is 15.4 MB because macOS's built-in encoder can't go smaller at 1080p. ffmpeg (`brew install ffmpeg`, Julia said no for now) would get it to about 3–5 MB: `ffmpeg -i "Comp 3.mp4" -c:v libx264 -crf 24 -preset slow -pix_fmt yuv420p -movflags +faststart -an showreel.mp4`.
- [ ] Covers for BBDO and Skylark Learning.
- [x] Case-study page for Disney (from https://artemovadesign.notion.site/drinkware-design-for-disney).
- [x] Case-study page for Dodo Pizza UK (from https://artemovadesign.notion.site/Menu-in-store-design-21cc11c9549080b9bd7aff9dcd459826).
- [x] Case-study page for Presentations (from https://artemovadesign.notion.site/presentation-design).
- [ ] Karsten International (current employer, packaging) was dropped from the grid when Presentations took its slot. Possible project to bring back.
- [ ] Higher-resolution portrait.
- [x] Add the live GitHub Pages URL here.
- [x] Install git, Homebrew and GitHub CLI so Claude can push updates directly.

## Contact details used on the site

- Email: juliya1196@gmail.com
- LinkedIn: https://www.linkedin.com/in/juliya-artemov%D0%B0/
- Notion portfolio (CV link): https://artemovadesign.notion.site/portfolio

The Starbucks × Peanuts case study is paraphrased from Starbucks Stories (March 24, 2025), which the page credits and links to.
