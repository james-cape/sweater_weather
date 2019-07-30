class Api::V1::RoadTripController < Api::V1::ApiBaseController

  def create
    if user_params[:api_key]
      render json: ForecastSerializer.new(forecast, user_params[:destination]).forecast_at(duration[:value])
    else
      render status: 401, json: {}
    end
  end

  private

  def user_params
    params.permit(:origin, :destination, :api_key)
  end

  def coordinates
    CoordinateService.new.get_results(params[:destination])
  end

  def duration
    DurationService.new.get_duration(params[:origin], params[:destination])
  end

  def forecast
    ForecastService.new.get_results(coordinates[:coordinates], duration[:value])
  end
end
