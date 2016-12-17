class Activity < ApplicationRecord
  belongs_to :user

  def self.attributes_from_raw(raw)
    { strava_id: raw['id'],
      name: raw['name'],
      start_date: raw['start_date'],
      timezone: raw['timezone'],
      start_lat: raw['start_latitude'],
      start_long: raw['start_longitude'],
      end_lat: raw['end_latlng'].first,
      end_long: raw['end_latlng'].last,
      raw: raw.to_json }
  end
end
