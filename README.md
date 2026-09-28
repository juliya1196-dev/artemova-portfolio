# Julia Artemova — Portfolio Site

One-page portfolio for **Julia Artemova**, Senior Creative & Graphic Designer / Art Director (Tech / Retail / Publishing), based in Amsterdam.

Plain HTML + CSS + a few lines of JS. No framework, no build step: open `index.html` in a browser and it works.

- Content source: Julia's CV (`~/Downloads/CV_Artemova (1).pdf`; the newer `~/Downloads/CV_Artemova.pdf` is the source for `cv.html`)
- Style reference: https://victorinesnijders.com/ (dark, image-led project grid, floating nav)

## Where things live

| What | Where |
|---|---|
| Local files | `~/artemova-portfolio` (git clone of the repo) |
| GitHub repo | https://github.com/juliya1196-dev/artemova-portfolio (branch `main`) |
| Claude preview (private) | https://claude.ai/artifact/SLw4XN7WY7JYgnxHEEiDw2 |
| Live site | **https://artemovadesign.com** (GitHub Pages, deploys automatically from `main` a minute or two after each push). The old https://juliya1196-dev.github.io/artemova-portfolio/ addresses redirect there, page by page, and www.artemovadesign.com redirects to the bare domain. |
| Domain | `artemovadesign.com`, bought by Julia at Porkbun on 2026-09-28 ($11.08/yr, auto-renew on, WHOIS privacy on; paid until 2027-09-28). DNS at Porkbun: four `A` records for the bare domain → `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153` (GitHub Pages), and `CNAME www` → `juliya1196-dev.github.io`. GitHub Pages custom domain = `artemovadesign.com` (the `CNAME` file in the repo), "Enforce HTTPS" on; the Let's Encrypt certificate renews by itself. |
| Local preview | http://localhost:8000 — `python3 -m http.server 8000` in the project folder, or the `site` entry in `.claude/launch.json` for Claude's browser pane |

This Mac has Apple's Command Line Tools (git), Homebrew and GitHub CLI (`gh`, logged in as `juliya1196-dev`). Updates go to GitHub with `git commit` + `git push`; no more uploading files by hand. Commits use the GitHub no-reply email so Julia's address stays out of the public history.

## Files

| File | Purpose |
|---|---|
| `index.html` | **The site.** Source of truth; this is what goes to GitHub. |
| `favicon.svg`, `favicon-32.png`, `apple-touch-icon.png` | The browser-tab icon: Julia's orange "a" (`#ff4b27`), from her `Безымянный-1.svg` in Downloads, trimmed to the letter alone (the file also carried the full wordmark, hidden off-canvas) on a square canvas. Browsers that read SVG icons use `favicon.svg`; the rest (older Safari) use the 32px PNG; `apple-touch-icon.png` (180px, the "a" on the site's `#121010`) is for iPhone home screens and bookmarks. Every page links all three in its `<head>` (`../` from `projects/`). |
| `CNAME` | One line, `artemovadesign.com`: tells GitHub Pages which domain serves the site. Don't delete or rename it, or the domain stops working. |
| `projects/starbucks-peanuts.html` | Case-study page for the first tile (opens in a new tab): "Merchandise Design for Starbucks". Rebuilt on 2026-09-28 from Julia's Notion page (https://artemovadesign.notion.site/Merchandise-Design-for-Starbucks-21bc11c954908090a00ccbef88c874dd) like the other case studies: text word for word, images in Notion's order and column groupings (Christmas cups, Kuwait National Day, Peru 20 years, Türkiye 100th anniversary, "She Is This" by Shae Anthony). It replaced an earlier Starbucks × Peanuts write-up paraphrased from Starbucks Stories. The file name is kept so links don't break. |
| `projects/starbucks/` | The 14 images for that page (Notion's first image is the cover, `project-starbucks-peanuts.webp`). The two Peru tumbler shots are transparent PNGs shown without a frame (`.cutout`); the last group is a `.mosaic` (one tall image, two cropped to share its height). |
| `projects/disney-drinkware.html` | Case-study page for the Disney tile (opens in a new tab). Structure, text and images come from Julia's Notion page; the text is word for word. No link back to Notion on case-study pages (Julia's request). |
| `projects/dodo-pizza-uk.html` | Case-study page for the Dodo Pizza UK tile (opens in a new tab). Built from Julia's Notion page the same way as Disney, except that the year "2021" under Company in Credits is left out (Julia's request). |
| `projects/dodo-pizza-uk/` | The 8 images for the Dodo Pizza UK case study, from that Notion page. Its cover is `project-dodo-pizza-uk.jpg`. |
| `projects/presentations.html` | Case-study page for the Presentations tile (opens in a new tab). Built from Julia's Notion page like the others: the process steps (Notion numbers them 1, 2, 3, 5; the site renumbers them 01–04 at Julia's request) with three event decks in between, then the Alfa Bank pitch. Includes a YouTube embed (youtube-nocookie) of the 14th Dodo Pizza Partners Congress. |
| `projects/presentations/` | 13 images and 9 slide animations for that page. The animations were GIFs in Notion (47 MB); they're MP4s here (12 MB) with a first-frame `.jpg` poster each. They load only when scrolled near and pause off-screen. Cover is `project-presentations.webp`, which replaces Notion's first (Russian) stage photo. |
| `projects/catalogue-shooting.html` | Case-study page for the Visual for Combo Deals tile (opens in a new tab). Built from Julia's Notion page (https://artemovadesign.notion.site/Catalogue-shooting-0dbcc8d344fa422abe3661c70a17bdc2) like the others: text word for word, images in Notion's order, except that the "Concept Development" heading and the Russian-language shoot and retouch brief under it are left out (Julia's request). The cover (not in Notion, supplied by Julia) sits at the top, and Notion's first image moved to just below the intro paragraph. Notion's "Tools & Resources" is empty, so the page has no facts row. Notion doesn't name the client; the photos show Dodo Pizza combos. |
| `projects/catalogue-shooting/` | 5 images from that Notion page: two pizzas + Coca-Cola, the website's Combo page, two pizza compositions, and a pizza + drink + Dodster combo. |
| `projects/social-media-content.html` | Case-study page for the Social Media Content tile (opens in a new tab). Built from Julia's Notion page (https://artemovadesign.notion.site/Social-Media-Content-6c0e938865aa4cbaa171c3978eb9e594): text and bold words word for word, images and videos in Notion's order; the five numbered steps use the 01–05 style of the Presentations page. Notion's unnamed description ("Dodo Brands – Social Media Content / I led creative direction…") became the eyebrow and the line under the title. **This page is light** (Julia's request): white background and the site's near-black `#121010` as text, set in the page's own `:root`; small orange labels (step numbers) use the darker `#B8390F`, like the dock's CV link, for contrast on white. Images have no border here (Julia's request), so white-background images blend into the page. The other pages stay dark. |
| `projects/social-media-content/` | 8 images and 2 videos for that page. The videos were Facebook and Twitter embeds in Notion (both posted by Dodo Pizza Leamington); Julia chose to host copies instead of embedding the players. "Meet our pizza heroes" (Facebook) exists in HD only as VP9, so the page offers `pizza-heroes-1080-vp9.mp4` first and falls back to the 426×426 H.264 `pizza-heroes-426.mp4` for browsers without VP9 (checked with the `type` codecs string); the poster is Facebook's 1080 thumbnail. `app-launch.mp4` is the tweet's 720×720 H.264 video, with a first-frame poster. Both show controls, load nothing until played, and have sound. |
| `cat.html` | The "reward" page linked from the very bottom of the home page: "Thanks for making it till the end" / "Here is your *reward*" and a photo of Julia's cat Flinn (`cat-flinn.webp`) with the caption "My cat Flinn :-)" in italic Fraunces. |
| `cat-flinn.webp` | Photo of Flinn, a grey Maine Coon (1086×1448, as Julia sent it in chat). |
| `tools/gif2mp4.swift` | Converts a GIF to an H.264 MP4 plus a poster JPEG with Apple's built-in frameworks (no ffmpeg needed). Build: `swiftc -O -sdk /Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk tools/gif2mp4.swift -o /tmp/gif2mp4` (the newest SDK doesn't match this Mac's Swift compiler). Run: `/tmp/gif2mp4 in.gif out.mp4 2500000 poster.jpg`. |
| `projects/disney/` | The 7 images for the Disney case study, downloaded from that Notion page. Its cover is `project-disney.jpg`. |
| `julia-photo.jpg` | Portrait, used in About and on `cv.html`. Julia's 1500×1500 black-and-white photo (sent in chat, September 2026), resized to 600×600 so it stays sharp on Retina screens at its 190px display size. It replaced the old 280×300 crop from the CV PDF. |
| `cv.html` | Julia's CV as a web page (the emailable A4 PDF is built from `cv-print.html`; keep the two in step), in the site's style. Opens from "CV" in the dock (new tab), has the same "Back to Portfolio" bar and footer as the case studies. Text is the CV PDF word for word, with these differences: the title is the site's current one ("Senior Creative & Graphic Designer / Art Director", the PDF still says "Senior Graphic & Packaging Designer"); two typos fixed ("Print Desing" → "Print Design", "Create an user-friendly" → "a user-friendly"); no phone number (it's off the site on purpose) and no Notion portfolio link; LinkedIn added; Tools grouped like the home Toolkit (Design / AI Tools / Productivity). Order: header with photo and contacts, intro (key words underlined in orange, like the PDF), Core competencies, Experience, Tools & Tech, then Education / People of Print / Freelance clients cards. |
| `cv-print.html` | Two-page A4 version of the CV on white, in the site's style, for Julia to send by email. Each `.page` is exactly one A4 sheet (595 × 842 CSS px = pt). Same text as `cv.html`, plus Julia's phone number and the portfolio address artemovadesign.com; page 1 has the header, contacts, intro, Core competencies and the Karsten job, with Tools & Tech and Education on the side; page 2 has the other five jobs, with Membership and Freelance clients on the side. Ligatures are off so ATS software and search read words like "Official" correctly. **Listed in `.gitignore`**: it stays on this Mac only, because the phone number is kept off the public site and repo. |
| `~/Downloads/Julia_Artemova_CV_2026.pdf` | The PDF made from `cv-print.html` with `tools/html2pdf.swift` (A4, 2 pages, ~175 KB, real text, clickable email / phone / portfolio / LinkedIn, title and author set). After changing `cv.html` or `cv-print.html`, rebuild it with that tool; it reports overflow per page (must be all zeros). |
| `tools/html2pdf.swift` | Turns `cv-print.html` into the A4 PDF with the Mac's WebKit; build and run commands are at the top of the file. |
| `showreel.mp4` | Hero showreel for screens wider than 700px. 1920×1080, 14.7 s, 15.4 MB, H.264 (Julia's "Comp 3.mp4", re-encoded with macOS `avconvert -p Preset1920x1080` from 27.7 MB). |
| `showreel-small.mp4` | Same showreel for phones (≤700px): the earlier 848×480, 2.9 MB Telegram export. |
| `project-starbucks-peanuts.webp` | Cover: Starbucks (Peanuts + Starbucks drinkware; also the first image of the Notion page) |
| `project-disney.jpg` | Cover: Disney drinkware |
| `project-dodo-pizza-uk.jpg` | Cover: Dodo Pizza UK |
| `project-presentations.webp` | Cover: Presentation & Pitch Decks |
| `project-social-media-content.jpg` | Cover: Social Media Content (the #DODOPIZZAUK slices close-up from the Notion page; Notion's first image, the Christmas Party Deal banner, is too wide and text-heavy to crop into a tile, so it heads the case page instead). Also used in the page's last image pair. |
| `project-catalogue-shooting.webp` | Cover: Visual for Combo Deals (three pizzas on orange, 2000×1447; Julia sent it in chat, it isn't on the Notion page) |
| `portfolio.html` | Copy of `index.html` for the Claude preview only. Local file, listed in `.gitignore` so it never goes to GitHub. |

**Moving between case studies.** Each case-study page has a "Next: …" link on the right of the sticky top bar (just "Next" on phones). It opens in the same tab. The order follows the home grid and loops: Merchandise Design for Starbucks → Disney → Dodo Pizza UK → Presentations → Visual for Combo Deals → Social Media Content → back to Starbucks. When a new case study is added, point the previous last page's link to it, and point the new page's link back to Starbucks. (A big "Next Project" cover tile at the bottom was tried and removed at Julia's request: next-project navigation lives in the top bar only.)

**Case-study footer** is the same as the home page footer: "© 2026 Julia Artemova" on the left, "Senior Creative & Graphic Designer / Art Director — Amsterdam, NL" on the right, no divider line, at the very bottom of the page.

`portfolio.html` is `index.html` without the page wrapper lines (`<!doctype>`, `<html>`, `<head>`, `<meta charset>`, `<meta viewport>`, `</head>`, `<body>`, `</body>`, `</html>`), because the Claude preview adds its own. Edit `index.html`, then regenerate `portfolio.html` from it only if the preview needs updating.

## Page structure (top to bottom)

0. **Loader**: full-screen dark overlay with Julia's orange "art" logo rising letter by letter, a thin orange progress line and a percentage. It waits for the fonts and the first 4 seconds of the showreel (at least 1.3 s so the animation plays, at most 6 s), then slides up like a curtain and the showreel starts from the beginning. With reduced motion it simply fades. It only exists when JavaScript runs (`html.js`), and a timer lifts it even in a background tab.
1. **Bottom dock nav**: fixed, centered, white rounded rectangle. Julia's orange logo (SVG inlined), then About · Projects · Contacts · CV (same order as the sections on the page). "CV" opens `cv.html` in a new tab (until September 2026 it linked to her Notion portfolio).
   - **Back to top**: white pill in the top-left corner (same look as the dock) with an up arrow. Appears once the page is scrolled more than two screen heights, links to `#top`, scrolls smoothly (instantly with reduced motion).
2. **Hero** (`#hero`): the showreel video at full width (`showreel-small.mp4` on phones, `showreel.mp4` elsewhere, picked by `<source media>`), autoplaying, muted and looping. It keeps its own 16:9 shape instead of filling the screen height, because the collage runs to the left and right edges and cropping would cut those images off. Black background to match the video. If the browser paused it in a background tab, it restarts when the tab becomes visible.
3. **About** (`#about`): styled like the top of `cv.html`, trimmed at Julia's request: "Julia *Artemova*" (surname in orange italic), the title, "Tech / Retail / Publishing", the square portrait on the right (on top on phones), then the bio in large Fraunces with "over 9 years", "empathy", "logic" and "responsibility" underlined in orange, and under it a "Go to CV ↗" pill (mono, outlined, fills white on hover) that opens `cv.html` in a new tab, like the dock's CV link. No label above the name, and no Email / LinkedIn / Based in row (those stay on `cv.html` only). Keep the shared parts in step with `cv.html`.
4. **Projects** (`#work`): 2-column grid, 20px side padding and 20px gaps, square corners, no borders. Each tile is a full-bleed image with a dark overlay and the title centered. On hover a "Go to project ↗" pill appears under the title; it's sized by its own text, so it's the same width on every tile.
   1. Merchandise Design for Starbucks (Merchandise Design). Links to its case-study page (`projects/starbucks-peanuts.html`; the tile was called "Starbucks × Peanuts" / "Global Collaboration" until the page was rebuilt).
   2. Disney (Drinkware Design). Links to its case-study page.
   3. Visual Style of Dodo Pizza in UK (Art Direction). Links to its case-study page.
   4. Presentation & Pitch Decks Design (Corporate Communications). Links to its case-study page.
   5. Visual for Combo Deals (Art Direction). Links to its case-study page (`projects/catalogue-shooting.html`; the page itself keeps Notion's title, "Catalogue shooting").
   6. Social Media Content (Marketing). Links to its case-study page.
   7. BBDO (Automotive Campaign). Placeholder, no cover yet.
   8. Skylark Learning (Digital Product Design). Placeholder, no cover yet.
5. **Contact** (`#contact`): just two large underlined text links in the heading font, the email and "LinkedIn ↗". They turn orange on hover. No heading, no buttons.
6. **Footer**: © 2026 line, and under it a small link in the same mono style and colour, "Thanks for making it till the end, here is your reward →", which opens `cat.html` in a new tab (a hidden reward: a photo of Julia's cat).

Sections slide up and fade in as they scroll into view (`data-reveal` on each `<section>` plus an IntersectionObserver), and scrolling snaps gently to section starts. Both switch off for people who have reduced motion turned on; for them the showreel also starts paused, with play controls.

## Design system

- **Dark theme** (one exception: `projects/social-media-content.html` is light): near-black background `#121010`, warm off-white text `#F5EFE3`, accent orange `#FF6B3D`. The logo orange is `#ff4b27`. All colors are CSS variables at the top of `index.html`.
- **Fonts** (Google Fonts): Fraunces (headings), JetBrains Mono (labels, nav), Archivo (body text).
- **Case-study spacing**: every block on a case-study page (text chapter, image, image pair, group of slides) is the same distance from the next one, `clamp(48px, 7vw, 88px)`, set by `.story > * + *`. Images inside one group sit 18px apart. A big section heading sits closer to what follows it (`clamp(28px, 4vw, 40px)`). Don't give a block its own `margin: 0`: it cancels that spacing (this was the bug on the Presentations page, where every `<figure>` stuck to the text above it).
- **Dock**: white background with dark text; the CV link is dark orange `#B8390F` for contrast.

## Julia's decisions (don't undo without asking)

- No top header. The bottom dock is the only navigation.
- Project tiles have no rounded corners and no outline. The image fills the tile and the name is centered.
- The bio is Julia's CV intro, word for word. Don't rewrite it.
- About comes straight after the showreel; Projects follow it.
- Removed on purpose: hero headline and text, top info strip, scrolling client ticker, "Selected Work" heading, Experience timeline, the "About" label and icon, the "9+ Years" / "8+ Core Disciplines" blocks, the "Hi, I'm Julia." heading and the orange "Amsterdam, NL" tag on the photo (all replaced by the CV-style About), the Tools & Tech / Education / People of Print section ("The kit." / "Credentials."; all of it is on `cv.html`), the Capabilities section (5 disciplines, "What's on spec."), phone number, the "Full Portfolio" link in Contact, and everything else in Contact except the two links (the "Get In Touch" label, the "Let's put your brand on the shelf." heading, "Based In — Amsterdam, NL", "Status — Open To New Projects", and the note "Also available for freelance. Recent freelance clients: Selfwork, Drinkit, Alfa Bank, Dodo Brands.").
- Case-study pages are built from Julia's Notion pages: same structure and images, text word for word, no link back to Notion. The tile becomes a link with `target="_blank"`.
- Missing images get an honest placeholder ("Cover coming soon"), never a stand-in picture.

## Open to-dos

- [x] Showreel video for the hero.
- [x] Sharper showreel (1920×1080).
- [ ] Lighter showreel. `showreel.mp4` is 15.4 MB because macOS's built-in encoder can't go smaller at 1080p. ffmpeg (`brew install ffmpeg`, Julia said no for now) would get it to about 3–5 MB: `ffmpeg -i "Comp 3.mp4" -c:v libx264 -crf 24 -preset slow -pix_fmt yuv420p -movflags +faststart -an showreel.mp4`.
- [ ] Covers for BBDO and Skylark Learning.
- [x] Photo of Julia's cat for `cat.html`.
- [x] Case-study page for Disney (from https://artemovadesign.notion.site/drinkware-design-for-disney).
- [x] Case-study page for Dodo Pizza UK (from https://artemovadesign.notion.site/Menu-in-store-design-21cc11c9549080b9bd7aff9dcd459826).
- [x] Case-study page for Presentations (from https://artemovadesign.notion.site/presentation-design).
- [ ] Presentations page, waiting on Julia: (1) the Notion title says "Pitch Desks"; the site uses "Pitch Decks" to match the tile. (2) ~~Step numbering~~: done, renumbered 01–04 (Animation is 04).
- [ ] Karsten International (current employer, packaging) was dropped from the grid when Presentations took its slot. Possible project to bring back.
- [x] Higher-resolution portrait.
- [x] Add the live GitHub Pages URL here.
- [x] Custom domain artemovadesign.com (September 2026).
- [ ] Verify artemovadesign.com in GitHub account settings (Settings → Pages → Add a domain, then a TXT record at Porkbun). Optional, protects the domain from being claimed by another GitHub account if the site is ever unpublished.
- [x] Install git, Homebrew and GitHub CLI so Claude can push updates directly.

## Contact details used on the site

- Email: juliya1196@gmail.com
- LinkedIn: https://www.linkedin.com/in/juliya-artemov%D0%B0/
- Notion portfolio (was the dock's CV link before `cv.html`): https://artemovadesign.notion.site/portfolio

