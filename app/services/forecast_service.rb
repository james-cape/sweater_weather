class ForecastService

  def get_results(latlong, time_in_sec = nil)
    if time_in_sec
      forecast_time = (Time.now + (time_in_sec / (60 * 60)).hours).to_i
      get_json("#{ENV['DARK_SKY_API_KEY']}/#{latlong[:lat]},#{latlong[:lng]},#{forecast_time}")
    else
      get_json("#{ENV['DARK_SKY_API_KEY']}/#{latlong[:lat]},#{latlong[:lng]}")
    end
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
