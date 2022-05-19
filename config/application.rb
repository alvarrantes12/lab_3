require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module Lenguajes1
  class Application < Rails::Application
    
    config.load_defaults 7.0

    I18n.load_path +=Dir[Rails.root.join('config','locales','*.{yml}')]
    I18n.default_locale = :es
 
  end
end
