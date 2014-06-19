
activate :directory_indexes
activate :autoprefixer
#activate :livereload

page "*", :layout => "_layout"
#set :index_file, "layout.html"

set :source,     '/docs'

set :css_dir,    'assets/stylesheets'
set :js_dir,     'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir,  'assets/fonts'

# set :helpers_dir,  ''
# set :layouts_dir,  'layouts'
# set :partials_dir, ''
# set :source,       'source'

ready do
  sprockets.append_path '/app/assets'
  sprockets.append_path '/vendor/assets'
  sprockets.append_path File.join root, 'vendor/bower'
end

configure :development do
  set :debug_assets, true
end

# Build-specific configuration
configure :build do

  activate :minify_css
  activate :minify_javascript

  # Ignoring files
  # ignore 'javascripts/lib/*'

  # Enable cache buster
  # activate :asset_hash
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
