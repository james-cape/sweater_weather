class Api::V1::ForecastController < Api::V1::ApiBaseController

  def index
    coordinates = CoordinateService.new(params[:location]).get_results

    forecast = ForecastService.new(coordinates)


    # render status: 201, json: {}
  end
end
