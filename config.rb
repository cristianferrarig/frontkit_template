###
# Page options, layouts, aliases and proxies
###

# set :index_file, "index.html"

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# page "/path/to/any/*", :layout => ":otherlayout"
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
#
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }



###
# Utilities
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Automatic alt attribute on image_tag helper
activate :automatic_alt_tags

# Automatically add vendor prefixes to CSS rules in stylesheets.
# The extension has 2 optionally configurable fields:
# https://github.com/ai/autoprefixer#browsers
# activate :autoprefixer do |config|
#   config.browsers = ['last 2 versions', 'Explorer >= 9']
#   config.cascade  = false
# end
activate :autoprefixer

# Middleman provides the Directory Indexes extension to tell Middleman
# to create a folder for each .html file and place the built template file
# as the index of that folder.
activate :directory_indexes



###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end



###
# Haml
###

## Haml to output unindented text

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# CoffeeScript filters in Haml
# First: gem install coffee-filter
# require 'coffee-filter'



###
# Project configuration
###

ready do
  # if you have assets in directories other than your :js_dir or :css_dir,
  # you can make them importable by adding them to your Sprockets import path.
  sprockets.append_path '/vendor/assets'
  # Sprockets supports Bower, so you can add your Bower components path directly:
  sprockets.append_path File.join root, 'vendor/bower'
end

# for physical directories at development mode
set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir,  'assets/fonts'


# set :source,       'source'
# set :build_dir,    'build'

# set :data_dir,     'data'
# set :helpers_dir,  'helpers'

# set :layout,       :_auto_layout
# set :layouts_dir,  'layouts'
# set :partials_dir, ''

# set :markdown_engine, :kramdown
# set :relative_links,  false

# set :http_prefix, '/'

configure :development do
  # Reload the browser automatically whenever files change
  # The extension supports a number of options that can be given to the activate statement.
  # activate :livereload do |config|
  #   config.apply_js_live  = false
  #   config.apply_css_live = false
  # end
  activate :livereload

  set :debug_assets, true
end

# Build-specific configuration
configure :build do

  # Ignoring files
  # ignore 'javascripts/lib/*'

  # Optimize images on build
  activate :imageoptim

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minify HTML files
  activate :minify_html

  # Enable cache buster
  activate :asset_hash
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # activate :asset_host
  # set :asset_host, "http://assets1.example.com"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true # default: false
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
