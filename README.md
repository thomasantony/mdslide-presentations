# mdslides-presentations

A template for creating technical presentations with Markdown, featuring support for interactive JavaScript demos, draw.io diagrams, and MathJax equations.

Built on [mdslides](https://github.com/dadoomer/markdown-slides) + [reveal.js](https://revealjs.com/).

## Features

- Write slides in Markdown
- Embed interactive JavaScript demos via iframes
- Include draw.io diagrams (auto-compiled to SVG)
- MathJax for equations
- Code syntax highlighting
- Speaker notes
- PDF export support

## Requirements

- Python 3.x
- [mdslides](https://github.com/dadoomer/markdown-slides): `pip install mdslides`

### Optional

- [draw.io CLI](https://github.com/jgraph/drawio-desktop): For diagram compilation (`brew install drawio` on macOS)

## Quick Start

```bash
# Clone this repo
git clone https://github.com/yourusername/mdslides-presentations.git
cd mdslides-presentations

# Copy the template
cp -r template/ my-presentation/
cd my-presentation/

# Edit your slides
$EDITOR src/slides.md

# Build
./build.sh

# Serve locally
python -m http.server 8000 -d html/
# Open http://localhost:8000
```

## Project Structure

```
my-presentation/
├── build.sh          # Build script
├── template.html     # Reveal.js HTML template
├── src/
│   ├── slides.md     # Your slide content
│   └── *.drawio      # Diagrams (optional)
├── demos/            # Interactive JS demos (optional)
│   └── my-demo/
│       └── index.html
└── html/             # Build output (generated)
```

## Writing Slides

Slides are separated by `---`:

```markdown
## First Slide

- Point one
- Point two

Note:
Speaker notes here (press 'S' to view)

---

## Second Slide

More content
```

## Embedding Demos

Create your demo in `demos/my-demo/index.html`, then embed it:

```html
<div class="container-container">
<iframe src="./demos/my-demo/index.html"
        style="width:100%; height:100%; border:none;">
</iframe>
</div>
```

Add a copy command to `build.sh`:

```bash
cp -R demos/my-demo html/demos/
```

## Including Diagrams

1. Create `src/my-diagram.drawio` using draw.io
2. build.sh auto-compiles it to SVG
3. Reference in slides: `![My Diagram](./my-diagram.svg)`

## Keyboard Shortcuts (in presentation)

| Key | Action |
|-----|--------|
| `→` / `Space` | Next slide |
| `←` | Previous slide |
| `S` | Speaker notes |
| `O` | Overview |
| `F` | Fullscreen |
| `Esc` | Exit fullscreen/overview |

## PDF Export

1. Open presentation in Chrome
2. Add `?print-pdf` to URL
3. Print (Ctrl+P) → Save as PDF

## Claude Code Integration

This repo includes a `SKILL.md` for use with [Claude Code](https://claude.ai/code). The skill provides quick reference for slide syntax and embedding patterns.

## License

MIT
