class UserSerializer
  def initialize(user)
    @user = user
  end

  def return_token
    { api_key: @user.token }
  end
end
