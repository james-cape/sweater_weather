class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :id, :item_id, :invoice_id, :quantity


  def initialize(forecast)
    @forecast = forecast
  end

  def snapshot
    {
      summary:              @forecast[:currently][:summary],
      temperature:          @forecast[:currently][:temperature],
      temperature_high:     @forecast[:daily][:data][0][:temperatureHigh],
      temperature_low:      @forecast[:daily][:data][0][:temperatureLow],
      city_state:
      country:
      time_date             Time.now #format this as '11:11 pm, 10/31'
    }
  end

  def details
    {
      short_summary:        @forecast[:daily][:data][0][:summary],
      long_summary:         @forecast[:daily][:summary],
      apparent_temperature: @forecast[:hourly][:data][0][:apparentTemperature],
      humidity:             @forecast[:daily][:data][0][:humidity],
      visibility:           @forecast[:daily][:data][0][:visibility],
      uv_index:             @forecast[:daily][:data][0][:uvIndex],
      uv_index_risk:        uv_risk(@forecast[:daily][:data][0][:uvIndex])
    }
  end


  def forecast(day = 0, hour = 0)
    {
      hourly: {
        temperature:        @forecast[:hourly][:data][hour][:temperature]
      },

      daily: {
        icon:               @forecast[:daily][:data][day][:icon],
        precip_probability: @forecast[:daily][:data][day][:precipProbability],
        temperature_high:   @forecast[:daily][:data][day][:temperatureHigh],
        temperature_low:    @forecast[:daily][:data][day][:temperatureLow]
      }
    }
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


# class InvoiceItemSerializer
#   include FastJsonapi::ObjectSerializer
#   attributes :id, :item_id, :invoice_id, :quantity
#
#   attribute :unit_price do |object|
#     (object.unit_price.to_f/100).to_s
#   end
#
# end
