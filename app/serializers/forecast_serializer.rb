class ForecastSerializer

  def initialize(forecast, citystate, country)
    @forecast = forecast
    @citystate = citystate
    @country = country
    @days = (0..4).to_a
    @hours = (0..7).to_a
    @current_time = Time.now
  end

  def forecast_all
    {
      snapshot: snapshot,
      details: details,
      hourly_data: hourly_data,
      daily_data: daily_data
    }
  end

  private

    def snapshot
      {
        summary:              @forecast[:currently][:summary],
        temperature:          @forecast[:currently][:temperature],
        temperature_high:     @forecast[:daily][:data][0][:temperatureHigh],
        temperature_low:      @forecast[:daily][:data][0][:temperatureLow],
        city_state:           @citystate,
        country:              @country,
        time_date:            @current_time.strftime("%I:%M %p") + ", " + @current_time.strftime("%m") + "/" + @current_time.strftime("%d")
      }
    end

    def details
      {
        short_summary:        @forecast[:daily][:data][0][:summary],
        long_summary:         @forecast[:daily][:summary],
        apparent_temperature: @forecast[:hourly][:data][0][:apparentTemperature],
        humidity:             @forecast[:daily][:data][0][:humidity],
        visibility:           @forecast[:daily][:data][0][:visibility],
        uv_index:             "#{@forecast[:daily][:data][0][:uvIndex]} (#{uv_risk(@forecast[:daily][:data][0][:uvIndex])})"
      }
    end

    def hourly_data
      {
        temperature: hourly_temperature
      }
    end

    def daily_data
      {
        icon:               daily_icon,
        precip_probability: daily_precip_probability,
        temperature_high:   daily_temperature_high,
        temperature_low:    daily_temperature_low
      }
    end

    def hourly_temperature
      @hours.map { |hour| @forecast[:hourly][:data][hour][:temperature] }
    end

    def daily_icon
      @days.map { |day| @forecast[:daily][:data][day][:icon] }
    end

    def daily_precip_probability
      @days.map { |day| @forecast[:daily][:data][day][:precipProbability] }
    end

    def daily_temperature_high
      @days.map { |day| @forecast[:daily][:data][day][:temperatureHigh] }
    end

    def daily_temperature_low
      @days.map { |day| @forecast[:daily][:data][day][:temperatureLow] }
    end

    def uv_risk(index)
      if index < 3
        'Low'
      elsif index < 6
        'Moderate'
      elsif index < 8
        'High'
      elsif index < 11
        'Very High'
      else
        'Extreme'
      end
    end

end
