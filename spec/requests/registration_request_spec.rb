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

    # results = JSON.parse(response.body, symbolize_names: true)


require 'pry'; binding.pry
    expect(User.last.email).to eq("whatever@example.com")

    expect(page).to have_content("Welcome, #{new_user.user_name}!")


    # require 'pry'; binding.pry

    # expect(results.keys).to contain_exactly(:end_city, :restaurants)
    # expect(results.class).to eq(Hash)
    # expect(results[:end_city].class).to eq(String)
    # expect(results[:restaurants].class).to eq(Array)
    # expect(results[:restaurants].count).to eq(3)
    # expect(results[:restaurants][0].keys).to contain_exactly(:name, :address)
    # expect(results[:restaurants][0][:name].class).to eq(String)
    # expect(results[:restaurants][0][:address].class).to eq(String)
  end
end
