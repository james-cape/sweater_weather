class Api::V1::RoadTripController < Api::V1::ApiBaseController

  def create
    if !user_params[:origin]
      render status: 401, json: {error: 'Enter origin'}
    elsif !user_params[:destination]
      render status: 401, json: {error: 'Enter destination'}
    elsif !user_params[:api_key]
      render status: 401, json: {error: 'Enter api_key'}
    elsif User.find_by(token: user_params[:api_key])
      trip = RoadTripFacade.new(user_params[:origin], user_params[:destination])
      render json: RoadTripSerializer.new(trip.get_road_trip_info)
    else
      render status: 401, json: {error: 'Invalid api_key'}
    end
  end

  private

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
