class CoordinateService

  def get_results(address)
    data = { address: address }
    results = get_json("geocode/json", data)[:results][0]

    citystate = "#{results[:address_components][0][:short_name]}, #{results[:address_components][2][:short_name]}"
    country = results[:address_components][3][:long_name]

    {
      coordinates: results[:geometry][:location],
      citystate: citystate,
      country: country
    }
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
