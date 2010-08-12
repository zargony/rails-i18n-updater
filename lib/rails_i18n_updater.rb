require 'rails/version'
require 'rails_i18n_updater/config'

module RailsI18nUpdater

  # Prepare load path: add Rails core locales to I18n.load_path
  # - only add locales that are actually used in the application
  # - prepend locales so that they can be overwritten by the application
  def self.prepare_i18n_load_path
    used_locales = I18n.load_path.map { |f| File.basename(f).gsub(/\.(rb|yml)$/, '') }.uniq
    files_to_add = Dir[File.join(RailsI18nUpdater::Config.local_path, '**', "{#{used_locales.join(',')}}.{rb,yml}")]
    I18n.load_path.unshift(*files_to_add)
  end
end

# Prepare new load path in after_initialize as the I18n.load_path might
# be modified in Rails initializers.
case Rails::VERSION::MAJOR
  when 3
    require 'rails_i18n_updater/railtie'
  when 2
    Rails.configuration.after_initialize do
      RailsI18nUpdater.prepare_i18n_load_path
    end
  else
    STDERR.puts "WARNING: Rails I18n Updater not loading. Unsupported Rails version #{Rails::VERSION::STRING}"
end
