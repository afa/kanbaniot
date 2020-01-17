easy_extensions = Redmine::Plugin.installed?(:easy_extensions)
app_dir = File.join(File.dirname(__FILE__), 'app')
lib_dir = File.join(File.dirname(__FILE__), 'lib', 'kaniot')

# Redmine patches
patch_path = File.join(lib_dir, 'redmine_patches', '**', '*.rb')
Dir.glob(patch_path).each do |file|
  require file
end
ActiveSupport::Dependencies.autoload_paths << File.join(app_dir, 'queries')
Rails.logger.info(ActiveSupport::Dependencies.autoload_paths.join(','))

ActiveSupport.on_load(:easyproject, yield: true) do
  Rails.logger.info 'dfa'
  begin
  require 'kaniot/hooks'
  rescue Exception => e
  Rails.logger.info e.inspect
  end
end

Rails.application.config.assets.precompile += %w[add_fields.js style.css]
