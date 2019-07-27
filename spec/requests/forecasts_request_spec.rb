require 'rails_helper'

describe 'coordinates API' do
  it 'gets a forecast for the city and state' do
    # coordinate_1 = create(:coordinate)
    # create(:coordinate)
    # create(:coordinate)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body)
    # expect(coordinates["data"].count).to eq(3)
    # expect(coordinates["data"][0]["attributes"]["creator"]).to eq(coordinate_1.creator)
    # expect(coordinates["data"][0]["attributes"]["commit_coordinates"]).to eq(coordinate_1.commit_coordinates)

  end
end
