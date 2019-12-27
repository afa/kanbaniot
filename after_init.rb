easy_extensions = Redmine::Plugin.installed?(:easy_extensions)
app_dir = File.join(File.dirname(__FILE__), 'app')
lib_dir = File.join(File.dirname(__FILE__), 'lib', 'kaniot')

# Redmine patches
patch_path = File.join(lib_dir, 'redmine_patches', '**', '*.rb')
Dir.glob(patch_path).each do |file|
  require file
end

