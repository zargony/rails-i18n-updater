namespace :i18n do
  desc 'Update (download) Rails core translations'
  task :update do
    require 'rails_i18n_updater/config'
    require 'shellwords'
    temp_path = "#{RailsI18nUpdater::Config.local_path}.tmp"
    sh <<-EOC
      rm -rf #{temp_path.shellescape} && \
      git clone -q --depth 1 #{RailsI18nUpdater::Config.repository_url} #{temp_path.shellescape} && \
      cd #{temp_path.shellescape} && \
      git checkout -q #{RailsI18nUpdater::Config.repository_branch} && \
      rm -rf #{RailsI18nUpdater::Config.local_path.shellescape} && \
      mv #{File.join(temp_path, RailsI18nUpdater::Config.repository_path).shellescape} #{RailsI18nUpdater::Config.local_path.shellescape} && \
      rm -rf #{temp_path.shellescape}
    EOC
  end
end
