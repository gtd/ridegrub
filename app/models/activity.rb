class Activity < ApplicationRecord
  belongs_to :user
  has_many :distances
  has_many :businesses, through: :distances

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

  def load_businesses
    [[start_lat, start_long],
     [end_lat, end_long]].each_with_index do |coords, point_type|
      create_distances(Ylp.search(*coords), point_type)
    end
    update_attribute(:businesses_processed, true)
  end

  private

  def create_distances(businesses, point_type)
    distances.where(point_type: point_type).destroy_all
    businesses.each do |b|
      business = Business.create_or_update_from_raw(b)
      # FIXME: Turns out duplicates DO happen.
      unless Distance.where(activity_id: id,
                          business_id: business.id,
                          point_type: point_type).exists?
        Distance.create(activity_id: id,
                        business: business,
                        meters: b.distance,
                        point_type: point_type,
                        # Also would like to populate corresponding values
                        # for richer search functionality but no time now.
                        close_to_point: true)
      end
    end
  end
end
