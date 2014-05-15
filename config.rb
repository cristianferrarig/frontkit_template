###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
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
# activate :automatic_image_sizes

# Automatically add vendor prefixes to CSS rules in stylesheets.
activate :autoprefixer

# The extension has 2 optionally configurable fields:
# https://github.com/ai/autoprefixer#browsers
# activate :autoprefixer do |config|
#   config.browsers = ['last 2 versions', 'Explorer >= 9']
#   config.cascade  = false
# end

# Reload the browser automatically whenever files change
activate :livereload

# Middleman provides the Directory Indexes extension to tell Middleman
# to create a folder for each .html file and place the built template file
# as the index of that folder.
activate :directory_indexes
# set :index_file, "default.html"



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
# Project configuration
###

set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir,  'assets/fonts'

ready do
  # if you have assets in directories other than your :js_dir or :css_dir,
  # you can make them importable by adding them to your Sprockets import path.
  sprockets.append_path '/vendor'
  # Sprockets supports Bower, so you can add your Bower components path directly:
  sprockets.append_path File.join root, 'bower'
end

configure :development do
  set :debug_assets, true
end

# Build-specific configuration
configure :build do

  # Ignoring files
  # ignore 'javascripts/lib/*'

  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
