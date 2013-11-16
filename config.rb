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

helpers do
  def nav_link(link_text, url, options = {})
    options[:class] ||= ""
    options[:class] << " active" if url == current_page.url
    link_to(link_text, url, options)
  end
end
