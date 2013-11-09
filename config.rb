<<<<<<< HEAD
require 'lib/helpers/custom_helpers'
helpers CustomHelpers

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :directory_indexes


# Markdown
set :markdown_engine, :redcarpet
set :markdown, {
  :fenced_code_blocks => true,
  :smartypants => true,
  :tables => true,
  :autolink => true,
}

ignore "/courses/_template.md.erb"

# Code highlighting
activate :rouge_syntax


configure :build do
end
