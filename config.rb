activate :livereload
set :markdown_engine, :redcarpet

set :markdown, {
  :tables => true,
  :autolink => true,
  :gh_blockcode => true,
  :fenced_code_blocks => true,
}

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :asset_hash
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
end

