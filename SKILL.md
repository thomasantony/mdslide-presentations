---
name: mdslides-presentations
description: Use when creating technical presentations with Markdown, especially when embedding interactive JavaScript demos, iframes, or draw.io diagrams into reveal.js slides
---

# mdslides-presentations

## Overview

Create reveal.js presentations from Markdown using mdslides, with support for embedded interactive demos, draw.io diagrams, and MathJax equations.

## Quick Start

```bash
# Install mdslides
pip install mdslides

# Copy the template
cp -r template/ my-presentation/
cd my-presentation/

# Edit slides
edit src/slides.md

# Build and serve
./build.sh
python -m http.server 8000 -d html/
```

## Slide Syntax

Slides are separated by `---`. Use `Note:` for speaker notes.

```markdown
## Slide Title

Content here

- Bullet points
- More points

Note:
Speaker notes go here (press 'S' in presentation to view)

---

## Next Slide
```

## Embedding Demos

Wrap iframes in a container for proper sizing:

```html
<div class="container-container">
<iframe src="./demos/my-demo/index.html"
        style="width:100%; height:100%; border:none;">
</iframe>
</div>
```

The demo folder should be copied to `html/` in build.sh.

## Diagrams

1. Create `.drawio` files in `src/`
2. build.sh compiles them to SVG (requires draw.io CLI)
3. Reference in slides: `![Diagram](./my-diagram.svg)`

## Key Files

| File | Purpose |
|------|---------|
| `src/*.md` | Slide content (Markdown) |
| `src/*.drawio` | Diagrams (optional) |
| `template.html` | Reveal.js template with custom styles |
| `demos/` | Interactive JavaScript demos |
| `build.sh` | Compiles everything to `html/` |

## Template Features

- **MathJax**: Use `$inline$` or `$$block$$` for equations
- **Code highlighting**: Fenced code blocks with language hints
- **Fragments**: Use `<!-- .element: class="fragment" -->` for animations
- **Columns**: Wrap in `<div class="columns">` for side-by-side layout
- **PDF export**: Print to PDF from browser (Ctrl+P), demos show placeholders

## Common Patterns

### Two-Column Layout
```html
<div class="columns">
<div>

Left content

</div>
<div>

Right content

</div>
</div>
```

### Fragment Animations
```markdown
- <!-- .element: class="fragment" --> Appears first
- <!-- .element: class="fragment" --> Appears second
```

### Styled Sections
```html
<style>
.my-slide { font-size: 0.8em; }
</style>

<div class="my-slide">
Content with custom styling
</div>
```

## Build Script

The template's `build.sh`:
1. Compiles `.drawio` files to SVG (if draw.io CLI installed)
2. Runs mdslides to generate reveal.js HTML
3. Copies demo folders to output
4. Copies SVG files to output

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Demos not loading | Check iframe path, ensure copied in build.sh |
| Diagrams missing | Install draw.io CLI: `brew install drawio` |
| Slides not updating | Re-run build.sh, clear browser cache |
| Math not rendering | Check MathJax CDN is accessible |
