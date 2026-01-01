# Embedding an Interactive Demo

## Basic iframe embed

```html
<div class="container-container">
<iframe src="./demos/my-demo/index.html"
        style="width:100%; height:100%; border:none;">
</iframe>
</div>
```

## With PDF fallback

When exporting to PDF, iframes don't render. Add a placeholder:

```html
<div class="container-container">
<iframe src="./demos/my-demo/index.html"
        style="width:100%; height:100%; border:none;">
</iframe>
</div>

<div class="demo-pdf-placeholder">
<h3>Interactive Demo</h3>
<p>View the live presentation for the interactive version</p>
<a href="https://your-hosted-url.com">https://your-hosted-url.com</a>
</div>
```

## Demo folder structure

```
demos/
└── my-demo/
    ├── index.html    # Entry point (loaded by iframe)
    ├── app.js        # Your demo logic
    └── style.css     # Demo-specific styles
```

## Adding to build.sh

Add this line to copy your demo to the output:

```bash
cp -R demos/my-demo html/demos/
```

## Tips

- Keep demos self-contained (no external dependencies if possible)
- Use ES modules with import maps for libraries like Three.js
- Test that demos work when served from a subdirectory
