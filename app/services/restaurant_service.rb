class RestaurantService

  def initialize; end

  def get_restaurants(restaurant_params, duration)

    # eta = (Time.now + 4.hours).to_i
    results = get_json("search?location=#{restaurant_params[:end]}")
    require 'pry'; binding.pry
    # results.map { |result| result[:url_o] }.compact!.first(quantity)
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.yelp.com/v3/businesses/') do |f|
      f.params['open_at'] = (Time.now + 4.hours).to_i
      f.params['term'] = 'restaurants'
      # f.params['location'] = 'denver,co'
      f.authorization :Bearer, "#{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end
end
