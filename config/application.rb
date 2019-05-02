# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AtcoderCircles
  class Application < Rails::Application
    config.load_defaults 5.2
    Rails.application.credentials.each do |key, value|
      ENV[key.upcase] = value.to_s
    end
    config.read_encrypted_secrets = true
  end
end
