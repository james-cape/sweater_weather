class Api::V1::SessionsController < Api::V1::ApiBaseController

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render status: 200, json: UserSerializer.new(user).return_token
    else
      render status: 401, json: {}
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
