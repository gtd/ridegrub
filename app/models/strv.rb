module Strv # Avoid global namespace collision
  class << self
    def client_id
      Rails.application.secrets.strava_client_id
    end

    def client_secret
      Rails.application.secrets.strava_client_secret
    end

    def authorization_url
      domain = Rails.configuration.app_domain
      parameters = { client_id: client_id,
        response_type: 'code',
        redirect_uri: "https://#{domain}/strava_token",
        scope: 'view_private',
        approval_prompt: 'force' }
      "https://www.strava.com/oauth/authorize?" + parameters.to_query
    end

    def get_access_token(code)
      access_response =
      Strava::Api::V3::Auth.retrieve_access(client_id,
                                            client_secret,
                                            code)
      Rails.logger.info(access_response)
      access_token = access_response['access_token']
    end
  end
end
