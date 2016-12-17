class User < ApplicationRecord
  has_many :activities

  def strava_authorized?
    strava_access_token.present?
  end

  def authorize_strava(access_token)
    update_attribute :strava_access_token, access_token
  end
end
