# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name       = "jekyll-theme-rtd"
  spec.version    = "1.4.0"
  spec.authors    = ["carlosperate"]
  spec.email      = ["carlosperate@embeddedlog.com"]

  spec.summary    = "Port of the Read the Docs theme to Jekyll to use with GitHub Pages."
  spec.homepage   = "https://github.com/carlosperate/jekyll-theme-rtd"
  spec.license    = "BSD-2-Clause"
  spec.metadata      = {
    "bug_tracker_uri"   => "https://github.com/carlosperate/jekyll-theme-rtd/issues",
    "documentation_uri" => "https://carlosperate.github.io/jekyll-theme-rtd/",
    "source_code_uri"   => "https://github.com/carlosperate/jekyll-theme-rtd",
  }

  spec.files       = Dir[
    "_includes/**/*",
    "_layouts/**/*",
    "assets/**/*",
    "LICENSE*",
    "README*"
  ]

  # To match GH Pages as much as possible dependency versions from:
  # https://pages.github.com/versions.json
  spec.add_runtime_dependency "jekyll", "~> 3.10"

  spec.add_development_dependency "github-pages", "~> 232"
  # Keep jekyll-remote-theme pinned in Gemfile to test local-path support (benbalter/jekyll-remote-theme #120).

  # Others unrelated to GH pages
  spec.add_development_dependency "jekyll-livereload", "~> 0.2.2"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
