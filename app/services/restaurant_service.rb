class RestaurantService

  def initialize; end #This extra functionality (address formatting, arrival time) could have been put into a facade

  def get_restaurants(restaurant_params, duration)
    results = get_json("search?", duration[:value], restaurant_params[:end], restaurant_params[:food])
    results[:businesses].map do |result|
      {
        name: result[:name],
        address: "#{result[:location][:address1]}, " +
                 "#{result[:location][:city]}, " +
                 "#{result[:location][:state]} " +
                 "#{result[:location][:zip_code]}"
      } # Could have created a restaurant object so these attributes could be easier to access than how I have it now
        # Could have put the map function into a facade too
    end
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
       # Time.now.to_i + time_in_sec #(doesn’t work)
      (Time.now + (time_in_sec / (60 * 60)).hours).to_i
    end
end
