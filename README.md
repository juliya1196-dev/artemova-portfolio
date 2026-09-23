# Julia Artemova — Portfolio Site

One-page portfolio for **Julia Artemova**, Senior Graphic & Packaging Designer (Food Tech / Retail / Publishing), based in Amsterdam.

Plain HTML + CSS + a few lines of JS. No framework, no build step: open `index.html` in a browser and it works.

- Content source: Julia's CV (`~/Downloads/CV_Artemova (1).pdf`)
- Style reference: https://victorinesnijders.com/ (dark, image-led project grid, floating nav)

## Where things live

| What | Where |
|---|---|
| Local files | `/Users/julia_artemova/artemova-portfolio` |
| Claude preview (private) | https://claude.ai/artifact/SLw4XN7WY7JYgnxHEEiDw2 |
| Live site | GitHub Pages, uploaded by hand through the github.com website. URL: _add once live_ |

This Mac has no git, GitHub CLI or Homebrew (Apple's Command Line Tools aren't installed), so updates go to GitHub by re-uploading changed files on github.com.

## Files

| File | Purpose |
|---|---|
| `index.html` | **The site.** Source of truth; this is what goes to GitHub. |
| `projects/starbucks-peanuts.html` | Case-study page for the Starbucks × Peanuts tile (opens in a new tab). |
| `julia-photo.png` | Portrait, cropped from the CV PDF (only 280×300; a sharper original would help). |
| `project-starbucks-peanuts.webp` | Cover: Starbucks × Peanuts |
| `project-disney.jpg` | Cover: Disney drinkware |
| `project-dodo-pizza-uk.jpg` | Cover: Dodo Pizza UK |
| `project-presentations.webp` | Cover: Presentation & Pitch Decks |
| `portfolio.html` | Copy of `index.html` for the Claude preview only. Not uploaded to GitHub. |

`portfolio.html` is `index.html` without the page wrapper lines (`<!doctype>`, `<html>`, `<head>`, `<meta charset>`, `<meta viewport>`, `</head>`, `<body>`, `</body>`, `</html>`), because the Claude preview adds its own. Edit `index.html`, then regenerate `portfolio.html` from it only if the preview needs updating.

## Page structure (top to bottom)

1. **Bottom dock nav**: fixed, centered, white rounded rectangle. Julia's orange logo (SVG inlined), then Projects · About · Contacts · CV. "CV" links to her Notion portfolio.
2. **Hero** (`#hero`): full screen, empty except a "Showreel — video coming soon" label. Reserved for a background video.
3. **Projects** (`#work`): 2-column grid, 20px side padding and 20px gaps, square corners, no borders. Each tile is a full-bleed image with a dark overlay and the title centered.
   1. Starbucks × Peanuts (Global Collaboration). Links to its case-study page.
   2. Disney (Drinkware Design)
   3. Art Directing Visual Style of Dodo Pizza UK (Art Direction)
   4. Presentation & Pitch Decks Design (Corporate Communications)
   5. BBDO (Automotive Campaign). Placeholder, no cover yet.
   6. Skylark Learning (Digital Product Design). Placeholder, no cover yet.
4. **About** (`#about`): photo on the left, "9+ Years" and "8+ Core Disciplines" blocks on the right. Below them, "Hi, I'm Julia." and the bio paragraph.
5. **Capabilities** (`#capabilities`): 5 rows (Package Design, Brand & Identity, Art Direction, Print Production, Digital & Content).
6. **Toolkit** (`#toolkit`): Tools & Tech pills, plus Education and People of Print membership cards.
7. **Contact** (`#contact`): email button, LinkedIn button, location and status, freelance clients note.
8. **Footer**: © 2026 line.

Sections slide up and fade in as they scroll into view (`data-reveal` on each `<section>` plus an IntersectionObserver), and scrolling snaps gently to section starts. Both switch off for people who have reduced motion turned on.

## Design system

- **Dark theme only**: near-black background `#121010`, warm off-white text `#F5EFE3`, accent orange `#FF6B3D`. The logo orange is `#ff4b27`. All colors are CSS variables at the top of `index.html`.
- **Fonts** (Google Fonts): Fraunces (headings), JetBrains Mono (labels, nav), Archivo (body text).
- **Dock**: white background with dark text; the CV link is dark orange `#B8390F` for contrast.

## Julia's decisions (don't undo without asking)

- No top header. The bottom dock is the only navigation.
- Project tiles have no rounded corners and no outline. The image fills the tile and the name is centered.
- The bio is Julia's CV intro, word for word. Don't rewrite it.
- Removed on purpose: hero headline and text, top info strip, scrolling client ticker, "Selected Work" heading, Experience timeline, the "About" label and icon, phone number, and the "Full Portfolio" link in Contact.
- Missing images get an honest placeholder ("Cover coming soon"), never a stand-in picture.

## Open to-dos

- [ ] Showreel video for the hero. Use `<video autoplay muted loop playsinline>` in `.video-slot`; compress it or host it externally.
- [ ] Covers for BBDO and Skylark Learning.
- [ ] Case-study pages for Disney, Dodo Pizza UK and Presentations. Copy the pattern of `projects/starbucks-peanuts.html` and turn the tile into a link with `target="_blank"`.
- [ ] Karsten International (current employer, packaging) was dropped from the grid when Presentations took its slot. Possible project to bring back.
- [ ] Higher-resolution portrait.
- [ ] Add the live GitHub Pages URL here.
- [ ] Optional: install git and GitHub CLI so Claude can push updates directly.

## Contact details used on the site

- Email: juliya1196@gmail.com
- LinkedIn: https://www.linkedin.com/in/juliya-artemov%D0%B0/
- Notion portfolio (CV link): https://artemovadesign.notion.site/portfolio

The Starbucks × Peanuts case study is paraphrased from Starbucks Stories (March 24, 2025), which the page credits and links to.
