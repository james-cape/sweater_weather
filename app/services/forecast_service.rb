class ForecastService

  def get_results(latlong, time_in_sec = nil)
    path = "#{ENV['DARK_SKY_API_KEY']}/#{latlong[:lat]},#{latlong[:lng]}"
    if time_in_sec
      path += ",#{forecast_time(time_in_sec)}"
    end
    get_json(path)
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

  def forecast_time(time_in_sec)
    (Time.now + time_in_sec).to_i
  end
end
