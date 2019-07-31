class Api::V1::RoadTripController < Api::V1::ApiBaseController

  def create
    if user_params[:api_key]
      trip = RoadTripFacade.new(user_params[:origin], user_params[:destination])
      render json: RoadTripSerializer.new(trip.get_road_trip_info)
    else
      render status: 401, json: {}
    end
  end

  private

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
