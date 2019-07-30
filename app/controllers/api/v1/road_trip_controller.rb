class Api::V1::RoadTripController < Api::V1::ApiBaseController

  def create
    if user_params[:api_key]
      render json: RoadTripSerializer.new(user).return_token
    else
      render status: 401, json: {}
    end
  end

  private

  def user_params
    params.permit(:origin, :destination, :api_key)
  end
end
