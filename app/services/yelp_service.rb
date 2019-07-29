class YelpService

  def initialize; end

  def get_results(location)
    results = get_json("search/", location)
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
      f.params['latitude'] = 37.786882
      f.params['longitude'] = -122.399972
      f.authorization :Bearer, "#{ENV['YELP_API_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end
end
