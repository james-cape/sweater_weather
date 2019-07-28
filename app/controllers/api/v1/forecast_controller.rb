class Api::V1::ForecastController < Api::V1::ApiBaseController

  def show
    coordinates = CoordinateService.new.get_results(params[:location])
require 'pry'; binding.pry
    forecast = ForecastService.new(coordinates)

    filtered_forecast = ForecastSerializer.new(forecast)
    # render status: 201, json: {}
  end
end
