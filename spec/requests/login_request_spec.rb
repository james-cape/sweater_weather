require 'rails_helper'

describe 'logging in' do
  it 'allows a user to log in' do
    user_1 = create(:user)

    params = {
      email: user_1.email,
      password: user_1.password
    }

    post '/api/v1/sessions', params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results.keys).to contain_exactly(:api_key)
    expect(results[:api_key].class).to eq(String)
  end
end
