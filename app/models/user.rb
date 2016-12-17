class User < ApplicationRecord
  has_many :activities

  def strava_authorized?
    strava_access_token.present?
  end

  def authorize_strava(access_token)
    update_attribute :strava_access_token, access_token
  end

  def load_recent_activities
    # TODO: Add error handling and deauthorization
    Strv.get_activities(strava_access_token).each do |a|
      activity = activities.where(strava_id: a['id']).first ||
                 activities.build
      activity.update_attributes Activity.attributes_from_raw(a)
    end
  end
end
