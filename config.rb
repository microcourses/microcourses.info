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

  def ruby(filename)
    "```ruby\n" +
    File.read(File.dirname(caller_locations(1, 1).first.path) + '/' + filename) +
    "```\n"
  end

  def streams
    published_resources.map{|page| page.data.stream }.uniq.compact
  end

  def course_pages(stream)
    unsorted_course_pages(stream).sort_by{|page| page.data.order.to_i }
  end

  private

  def published_resources
    sitemap.resources.select{|page| page.data.published != false }
  end

  def unsorted_course_pages(stream)
    sitemap.resources.select do |page|
      page.data.stream == stream and
      page.data.published != false and
      page.path.start_with?('courses/') and
      File.basename(page.source_file).start_with?('index')
    end
  end
end
