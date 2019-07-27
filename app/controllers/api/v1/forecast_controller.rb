class Api::V1::ForecastController < Api::V1::ApiBaseController

  def index
    coordinates = CoordinateService.new.get_results(params[:location])

    forecast = ForecastService.new(coordinates)


    # render status: 201, json: {}
  end
end
