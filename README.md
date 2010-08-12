Rails plugin to fetch and update core translations
==================================================

This Rails plugin adds Rails core translations to your application.

Rails core translations are downloaded from <http://github.com/svenfuchs/rails-i18n> by default.

Install
-------

Add the rails-i18n-updater gem to your Rails application. With Rails 3.x, add the
following to you `Gemfile`:

    gem 'rails-i18n-updater'

Use the i18n:update task to initially download core translations:

    $ rake i18n:update

If you're using Rails 2.x without Bundler, you need to add `config.gem 'rails-i18n-updater'`
to `config/environments.rb`. Also, you need to manually include the i18n:update task by
adding `require 'rails_i18n_updater/tasks'` to your application's `Rakefile`.

If you previously used the rails-i18n-updater plugin, you should remove it after
switching to the gem by simply deleting the directory `vendor/plugins/rails-i18n-updater`
in your application.

Update
------

To update to the latest core translations, use:

    $ rake i18n:update

How it works
------------

The plugin provides the rake task `i18n:update` which uses `git` to download the latest core translations to `vendor/rails-locales`. This rake task can be started manually whenever you want to update to the latest core translations.

On application start, the plugin automatically adds downloaded core translations to `I18n.load_path`. Only locales you used in your applications are added and they're prepended to the load path so you can override the defaults in your own locale files.

Limitations
-----------

- You need `git` in your PATH for `rake i18n:update` to work correctly.
- Your application must use the simple I18n backend (using .yml or .rb files for locales).

Author
------

Andreas Neuhaus :: <http://zargony.com/>
