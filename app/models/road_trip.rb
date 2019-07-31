class RoadTrip
  attr_reader :id, :temperature, :forecast_summary, :estimated_travel_time

  def initialize(forecast, citystate, duration)
    @id = 1
    @temperature = forecast[:currently][:temperature]
    @forecast_summary = forecast[:currently][:summary]
    @estimated_travel_time = duration
  end
end
