class CoordinateService

  def initialize; end

  def get_results(address)
    data = { address: address }
    get_json("geocode/json", data)[:results][0][:geometry][:location]
  end

  private

  def get_json(path, data)
    response = conn.get(path, data)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
      f.params['key'] = ENV['GEOCODE_GOOGLE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
