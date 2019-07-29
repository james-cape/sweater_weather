class DurationService

  def initialize; end

  def get_results(start, finish)
    data = {
      start: start,
      finish: finish
    }
    results = get_json("directions/json", data)
require 'pry'; binding.pry
    # citystate = "#{results[:address_components][0][:short_name]}, #{results[:address_components][2][:short_name]}"
    # country = results[:address_components][3][:long_name]
    #
    # {
    #   coordinates: results[:geometry][:location],
    #   citystate: citystate,
    #   country: country
    # }
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
