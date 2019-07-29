require 'rails_helper'

describe 'background image API' do
  it 'gets a background image for the city and state' do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese Content-Type: application/json Accept: application/json'

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)

    # expect(results.keys).to contain_exactly(:images)
    # expect(results.class).to eq(Hash)
    # expect(results[:images].class).to eq(Array)
  end
end
