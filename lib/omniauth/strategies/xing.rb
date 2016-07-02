require 'omniauth/strategies/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    #
    # Authenticate to Xing via OAuth and retrieve basic user information.
    # Usage:
    #    use OmniAuth::Strategies::Xing, 'consumerkey', 'consumersecret', :scope => 'read write', :display => 'plain'
    #
    class Xing < OmniAuth::Strategies::OAuth

      args [:consumer_key, :consumer_secret]

      option :client_options, {
        :access_token_path  => '/v1/access_token',
        :authorize_path     => '/v1/authorize',
        :request_token_path => '/v1/request_token',
        :site               => 'https://api.xing.com',
      }

      info do
        {
          email:        raw_info['active_email'],
          avatar_url:   raw_info['photo_urls']["size_1024x1024"],
          url:          raw_info['permalink'],
          organization: raw_info['organization'],
          name:         raw_info["display_name"],
          urls: {
            'public_profile' => raw_info["permalink"]
          }
        }
      end

      uid { access_token.params[:user_id] }

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode( access_token.get('/v1/users/me').body )["users"].first
      end

    end
  end
end
