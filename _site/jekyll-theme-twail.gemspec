# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme"
  spec.version       = "1.0.0"
  spec.authors       = ["authors"]

  spec.summary       = "Jekyll theme for blog"
  spec.license       = "MIT"

  spec.metadata["plugin_type"] = "theme"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
  spec.add_runtime_dependency "jekyll-paginate-v2", "~> 3.0"
  spec.add_runtime_dependency "jekyll-sitemap"
  spec.add_runtime_dependency "jekyll-gist"
end
