class Business < ApplicationRecord
  def self.create_or_update_from_raw(b)
    business = where(yelp_id: b.id).first || new

    business.attributes = {
      yelp_id: b.id,
      name: b.name,
      url: b.url,
      display_phone: b.display_phone,
      rating: b.rating,
      display_address: b.location.address.join(','),
      latitude: b.location.coordinate.latitude,
      longitude: b.location.coordinate.longitude,
      raw: b.to_json
    }

    business.save!
    business
  end
end
