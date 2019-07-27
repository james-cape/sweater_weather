require 'rails_helper'

describe 'forecasts API' do
  it 'sends a forecast' do
    forecast_1 = create(:forecast)
    create(:forecast)
    create(:forecast)

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    # expect(forecasts["data"].count).to eq(3)
    # expect(forecasts["data"][0]["attributes"]["creator"]).to eq(forecast_1.creator)
    # expect(forecasts["data"][0]["attributes"]["commit_forecasts"]).to eq(forecast_1.commit_forecasts)

  end
end
