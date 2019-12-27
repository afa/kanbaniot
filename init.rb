Redmine::Plugin.register :kaniot do
  name 'Kaniot Plugin'
  author 'vlad'
  description 'This is a Kanban plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

require_relative 'after_init'
