require 'faraday'
require 'aha-api/version'

module AhaApi
  module Configuration
    VALID_OPTIONS_KEYS = [
      :domain,
      :adapter,
      :faraday_config_block,
      :api_version,
      :api_endpoint,
      :login,
      :password,
      :proxy,
      :user_agent].freeze

    DEFAULT_ADAPTER = Faraday.default_adapter
    DEFAULT_API_VERSION = "v1"
    DEFAULT_API_ENDPOINT = "https://aha.io/"
    DEFAULT_USER_AGENT = "Aha! API Ruby Gem #{AhaApi::VERSION}".freeze

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end
    def api_endpoint
      if @api_endpoint == DEFAULT_API_ENDPOINT
        u = URI(@api_endpoint.to_s)
        if not (u.host =~ /[a-z0-9-]+\.[a-z0-9-]+\.[a-z0-9-]+/)
          u.host = "#{@domain}.#{u.host}"
        end
        u.to_s
      else
        @api_endpoint
      end
    end

    def faraday_config(&block)
      @faraday_config_block = block
    end

    def reset
      self.domain              = nil
      self.adapter             = DEFAULT_ADAPTER
      self.api_version         = DEFAULT_API_VERSION
      self.api_endpoint        = DEFAULT_API_ENDPOINT
      self.proxy               = nil
      self.login               = nil
      self.password            = nil
      self.user_agent          = DEFAULT_USER_AGENT
    end
  end
end