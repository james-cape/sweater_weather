class RestaurantService

  def initialize; end

  def get_restaurants(restaurant_params, duration)
    results = get_json("search/", restaurant_params[:end])
    require 'pry'; binding.pry
    # results.map { |result| result[:url_o] }.compact!.first(quantity)
  end

  private

  def get_json(path, location)
    response = conn(location).get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(location)
    Faraday.new('https://api.yelp.com/v3/businesses/') do |f|
      f.params['location'] = location
      f.authorization :Bearer, "#{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end
end
