require 'rails'

module RailsI18nUpdater
  class Railtie < Rails::Railtie
    initializer 'rails_i18n_updater.initialize' do
      config.after_initialize do
        RailsI18nUpdater.prepare_i18n_load_path
      end
    end
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'tasks.rb')
    end
  end
end
