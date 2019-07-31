class RoadTripFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_road_trip_info
    RoadTrip.new(forecast, @destination, duration[:value])
  end

  def coordinates
    @coordinates ||= CoordinateService.new.get_results(@destination)
  end

  def duration
    @duration ||= DurationService.new.get_duration(@origin, @destination)
  end

  def forecast
    @forecast ||= ForecastService.new.get_results(coordinates[:coordinates], duration[:value])
  end

end
