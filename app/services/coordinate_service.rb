class CoordinateService

  def initialize(address)
    @data = { address: address }
  end

  def get_results
    get_json("geocode/json")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
      f.params['key'] = ENV['GEOCODE_GOOGLE_API_KEY']
      f.params['address'] = @data[:address]
      f.adapter Faraday.default_adapter
    end
  end
end
