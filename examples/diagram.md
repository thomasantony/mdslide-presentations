# Using draw.io Diagrams

## Creating diagrams

1. Open [draw.io](https://app.diagrams.net/) or the desktop app
2. Create your diagram
3. Save as `.drawio` file in `src/` folder

## Automatic compilation

The build script automatically converts `.drawio` files to SVG:

```bash
# In build.sh (already included)
for f in src/*.drawio; do
    drawio --export --format svg --output "${f%.drawio}.svg" "$f"
done
```

## Referencing in slides

```markdown
## Architecture

![System Architecture](./my-diagram.svg)
```

Or with custom sizing:

```html
<img src="./my-diagram.svg" style="max-height: 60vh;">
```

## Requirements

Install the draw.io CLI:

```bash
# macOS
brew install drawio

# Linux - download from GitHub releases
# https://github.com/jgraph/drawio-desktop/releases
```

## Tips

- Use consistent colors across diagrams
- Export with transparent background for flexibility
- Keep diagrams simple - they'll be viewed on slides
- The build script skips compilation if draw.io CLI is not installed
