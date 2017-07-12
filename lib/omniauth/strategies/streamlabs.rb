require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Streamlabs < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'donations.read'

      option :name, "streamlabs"

      option :client_options, {
        site: 'https://streamlabs.com',
        authorize_url: '/api/v1.0/authorize',
        token_url: '/api/v1.0/token'
      }

      option :access_token_options, {
        header_format: 'Bearer %s',
        param_name: 'access_token'
      }

      option :authorize_options, [:scope]

      uid{ raw_info['twitch']['id'] }

      info do
        {
          display_name: raw_info['twitch']['display_name'],
          name: raw_info['twitch']['name']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1.0/user').parsed
      end

      def build_access_token
        super.tap do |token|
          token.options.merge!(access_token_options)
        end
      end

      def access_token_options
        options.access_token_options.inject({}) { |h,(k,v)| h[k.to_sym] = v; h }
      end

      def callback_url
        return options[:redirect_uri] unless options[:redirect_uri].nil?
        full_host + script_name + callback_path
      end

      def authorize_params
        super.tap do |params|
          options[:authorize_options].each do |k|
            params[k] = request.params[k.to_s] unless [nil, ''].include?(request.params[k.to_s])
          end
          params[:scope] = params[:scope] || DEFAULT_SCOPE
        end
      end
    end
  end
end
