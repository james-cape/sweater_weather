class ForecastService

  def initialize; end

  def get_results(latlong)
    get_json("#{ENV['DARK_SKY_API_KEY']}/#{latlong[:lat]},#{latlong[:lng]}")
  end

  private

  def get_json(path)
    response = conn.get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.darksky.net/forecast/") do |f|
      f.params['exclude'] = 'minutely,flags'
      f.adapter Faraday.default_adapter
    end
  end
end
