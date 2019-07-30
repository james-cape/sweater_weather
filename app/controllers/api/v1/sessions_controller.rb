class Api::V1::SessionsController < Api::V1::ApiBaseController

  def create
    user_1 = create(:user, email: 'email-1', token: '33ff')
    user = User.find_by(email: user_params[:email])
    require 'pry'; binding.pry
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
