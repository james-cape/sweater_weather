class Api::V1::UsersController < Api::V1::ApiBaseController

  def create
require 'pry'; binding.pry

    
    render json: UserSerializer.new(images)
  end

  private

    # def images
    #   UserService.new.get_results(params[:location], 1)
    # end
end
