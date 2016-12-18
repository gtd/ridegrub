module Ylp
  MAX_RADIUS = 40000

  class << self
    def search(lat, lng)
      search_r(lat, lng, 500, [])
    end

    private

    def search_r(lat, lng, radius, results)
      coords = {latitude: lat,
                longitude: lng}
      params = {category_filter: interesting_categories.first,
                sort: 1, # By distance
                radius_filter: radius}

      new_results = client.search_by_coordinates(coords, params).businesses
      # Beward this assumes results always come back in same order
      results += new_results[results.size..-1]

      if results.size >= 20 || radius == MAX_RADIUS
        results
      else
        search_r(lat, lng, next_radius(radius), results)
      end
    end

    def next_radius(radius)
      if radius < MAX_RADIUS/2
        radius * 2
      else
        MAX_RADIUS
      end
    end

    # We could do a lot more with this and expose it in the UI, but for the
    # simple case just use restaurants.  Also, the ruby Yelp client does not
    # seem to support an array of categories.
    def interesting_categories
      %w(restaurants)
    end

    def client
      @client ||= Yelp::Client.new(consumer_key: consumer_key,
                                   consumer_secret: consumer_secret,
                                   token: token,
                                   token_secret: token_secret)
    end

    def consumer_key
      Rails.application.secrets.yelp_consumer_key
    end

    def consumer_secret
      Rails.application.secrets.yelp_consumer_secret
    end

    def token
      Rails.application.secrets.yelp_token
    end

    def token_secret
      Rails.application.secrets.yelp_token_secret
    end
  end
end
