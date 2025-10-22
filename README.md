# Omarchy Torrents

Distributing Omarchy Linux via torrents, built with Middleman.

## Setup

Start the development server:

```bash
bundle exec middleman server
```

Visit `http://localhost:4567` in your browser.

## Building

```bash
bundle exec middleman build
```

Output goes to the `docs/` directory (configured for GitHub Pages).

## File Structure

```
.
├── config.yml              # Site and release configuration
├── config.rb               # Middleman configuration
├── Gemfile                 # Ruby dependencies
├── source/
│   ├── index.html.erb      # Homepage
│   ├── feed.xml.builder    # RSS feed
│   ├── layouts/
│   │   └── layout.erb      # Main layout
│   └── stylesheets/
│       └── style.css       # Styling
└── docs/                   # Built site
```

## License

MIT
