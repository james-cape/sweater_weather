class Api::V1::UsersController < Api::V1::ApiBaseController

  def create
    user = User.new(user_params)
    if user.save
      user.update(token: SecureRandom.hex())
      render status: 201, json: UserSerializer.new(user).return_token
    else
      render status: 201, json: {}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
