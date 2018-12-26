lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_lunr_js_search/version'

Gem::Specification.new do |s|
  s.name          = 'jekyll-lunr-js-search-multilingual'
  s.version       = Jekyll::LunrJsSearch::VERSION
  s.licenses      = ['MIT']
  s.summary       = 'Jekyll + lunr.js = static websites with powerful full-text search using JavaScript'
  s.description   = 'Plugin "jekyll-lunr-js-search-multilingual" is "jekyll-lunr-js-search" plugin but with multilingual support and where "therubyracer" is replaced by "execjs" for Windows support'
  s.authors       = ['Ben Smith', 'Professor Fortran']
  s.email         = 'prof.fortran@hotmail.com'
  s.files         = Dir.glob("lib/**/*.rb") + Dir.glob("build/*.min.js")
  s.homepage      = 'https://github.com/fortran-team/jekyll-lunr-js-search-multilingual'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'nokogiri', '~> 1.7'
  s.add_runtime_dependency 'json', '~> 2.0'
  s.add_runtime_dependency 'execjs', '~> 2.7'
  s.add_runtime_dependency 'os', '~> 1.0'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'uglifier', '~> 3.0'
end
