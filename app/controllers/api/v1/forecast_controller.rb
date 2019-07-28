class Api::V1::ForecastController < Api::V1::ApiBaseController

  def index
    location = CoordinateService.new.get_results(params[:location])

    forecast = ForecastService.new.get_results(location[:coordinates])

    filtered_forecast = ForecastSerializer.new(forecast, location[:citystate], location[:country])
    # render status: 201, json: {}
require 'pry'; binding.pry
    # render json: ForecastSerializer.new(forecast, location[:citystate], location[:country])

  end
end
