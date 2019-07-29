class BackgroundSerializer

  def initialize(images)
    @images = images
  end

  def forecast_all
    {
      snapshot: snapshot,
      details: details,
      hourly_data: hourly_data,
      daily_data: daily_data
    }
  end
end
