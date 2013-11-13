require 'lib/helpers/custom_helpers'

helpers CustomHelpers

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

ignore '/courses/_template*'

activate :directory_indexes
activate :livereload
activate :rouge_syntax # Code highlighting

set :markdown_engine, :redcarpet
set :markdown, {
  fenced_code_blocks: true,
  smartypants: true,
  tables: true,
  autolink: true,
  gh_blockcode: true,
}

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  set :relative_links, true
end
