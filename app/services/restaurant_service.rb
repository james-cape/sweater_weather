class RestaurantService

  def get_restaurants(restaurant_params, duration)
    get_json("search?", duration[:value], restaurant_params[:end], restaurant_params[:food])
  end

  private

    def get_json(path, time_in_sec, location, food)
      response = conn(time_in_sec, location, food).get(path)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn(time_in_sec, location, food)
      Faraday.new('https://api.yelp.com/v3/businesses/') do |f|
        f.params['open_at'] = arrival_time(time_in_sec)
        f.params['categories'] = food
        f.params['limit'] = 3
        f.params['location'] = location
        f.authorization :Bearer, "#{ENV['YELP_API_KEY']}"
        f.adapter Faraday.default_adapter
      end
    end

    def arrival_time(time_in_sec)
      (Time.now + time_in_sec).to_i
    end
end
