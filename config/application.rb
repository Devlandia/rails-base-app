require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBaseApp
  class Application < Rails::Application
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.generators.assets  = false
    config.generators.helper  = false
    config.generators do |g|
      g.helper_specs false
      g.view_specs false
      g.factory_girl dir: 'spec/factories'
    end

    config.i18n.available_locales = %w(en pt-BR)
    config.i18n.default_locale    = :en
    config.i18n.locale            = :en
    config.time_zone              = 'Pacific Time (US & Canada)'
    config.i18n.load_path        += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
