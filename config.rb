set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

ignore '/courses/_template*'
ignore '/courses/**/*.rb'
ignore '**/*.rb'

activate :directory_indexes
activate :livereload
activate :syntax

set(:markdown_engine, :redcarpet)
set(
  :markdown,
  fenced_code_blocks: true,
  smartypants: true,
  tables: true,
  autolink: true,
  gh_blockcode: true,
)

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  set :relative_links, true
end

I18n.enforce_available_locales = false

helpers do
  def nav_link(link_text, url, options = {})
    options[:class] ||= ""
    options[:class] << " active" if url.end_with?(current_page.path)
    link_to(link_text, url_for(url), options)
  end

  def ruby_file(filename)
    file(filename, 'ruby')
  end

  def file(relative_path, format = nil)
    require 'pathname'
    require 'middleman'

    course_dir = Pathname.new(caller_locations(1, 1).first.path).dirname
    disk_path = course_dir.join(relative_path)
    url_path = relative_path
    code = File.read(disk_path).strip
%{
<div class="code-filename"><a href="#{url_path}">#{relative_path}</a></div>
```#{format}
#{code}
```
}
  end

  def streams
    published_resources.map{|page| page.data.stream }.uniq.compact
  end

  def course_pages(stream)
    unsorted_course_pages(stream).sort_by{|page| page.data.order.to_i }
  end

  private

  def published_resources
    sitemap.resources.reject{|page| page.data.published == false }
  end

  def unsorted_course_pages(stream)
    sitemap.resources.select do |page|
      page.data.stream == stream &&
        page.data.published != false &&
        page.path.start_with?('courses/') &&
        File.basename(page.source_file).start_with?('index')
    end
  end
end
