class Api::V1::UsersController < Api::V1::ApiBaseController

  def create
    user = User.new(user_params)
    if !user_params[:password] || !user_params[:password_confirmation]
      render status: 401, json: {error: 'Missing password or confirmation'}
    elsif user_params[:password] != user_params[:password_confirmation]
      render status: 401, json: {error: 'Passwords do not match'}
    elsif user.save
      user.update(token: SecureRandom.hex())
      render status: 201, json: UserSerializer.new(user).return_token
    else
      render status: 401, json: {error: 'Email required or already taken'}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
