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
    options[:class] << " active" if url.end_with?(current_page.path)
    link_to(link_text, url_for(url), options)
  end

  def ruby_file(filename)
    file(filename, 'ruby')
  end

  def file(filename, format=nil)
    require 'pathname'
    require 'middleman'
    url_path = url_for(filename)
    disk_path = sitemap.find_resource_by_path(url_path).source_file
    code = File.read(disk_path).strip
%{
<div class="code-filename"><a href="#{url_path}">#{filename}</a></div>
```#{format}
#{code}
```
}
  end

  def streams
    sitemap.resources.select do |page|
      page.data.published != false
    end.map do |page|
      page.data.stream
    end.uniq.compact
  end

  def course_pages(stream)
    sitemap.resources.select do |page|
      page.data.stream == stream and
      page.data.published != false and
      page.path.start_with?('courses/') and
      File.basename(page.source_file).start_with?('index')
    end
  end
end
