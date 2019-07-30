require 'rails_helper'

describe 'registration' do
  it 'allows a user to register' do

    params = {
      user: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }

    post '/api/v1/users', params: params

    expect(response).to be_successful
    expect(response.status).to eq(201)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(User.last.email).to eq(params[:user][:email])
    expect(results.keys).to contain_exactly(:api_key)
    expect(results[:api_key].class).to eq(String)
  end
end
