class Api::V1::SessionsController < Api::V1::ApiBaseController

  def create
    if user = User.find_by(email: user_params[:email])
      render status: 200, json: UserSerializer.new(user).return_token
    else
      render status: 200, json: {}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
