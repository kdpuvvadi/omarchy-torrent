require "yaml"

# Load config
CONFIG = YAML.load_file("config.yml")

# Middleman configuration
set :site_title, CONFIG["site"]["title"]
set :site_description, CONFIG["site"]["description"]
set :site_url, CONFIG["site"]["url"]

# Build configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end

# GitHub Pages configuration
set :build_dir, "docs"

# Helpers
helpers do
  def config
    CONFIG
  end

  def site_config
    CONFIG["site"]
  end

  def releases
    CONFIG["releases"].sort_by { |r| Gem::Version.new(r["version"]) }.reverse
  end

  def latest_release
    releases.first
  end

  def format_date(date_string)
    Date.parse(date_string).strftime("%B %d, %Y")
  end

  def format_size(size_string)
    size_string
  end
end
