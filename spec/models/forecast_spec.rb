require 'rails_helper'

describe Forecast do
  it 'has attributes' do
    dark_sky_forecast = File.read('./spec/fixtures/dark_sky_response.rb')
    response = Forecast.new(dark_sky_forecast, 'denver,co', 'United States')

    expect(response.citystate).to eq('denver,co')
    expect(response.country).to eq('United States')
    expect(response.forecast).to eq(dark_sky_forecast)
  end
  #
  it 'generates risk profiles based on uv_index' do
    forecast = Forecast.new("1", "2", "3")

    expect(forecast.uv_risk(0)).to eq('Low')
    expect(forecast.uv_risk(1)).to eq('Low')
    expect(forecast.uv_risk(3)).to eq('Moderate')
    expect(forecast.uv_risk(5)).to eq('Moderate')
    expect(forecast.uv_risk(6)).to eq('High')
    expect(forecast.uv_risk(7)).to eq('High')
    expect(forecast.uv_risk(8)).to eq('Very High')
    expect(forecast.uv_risk(10)).to eq('Very High')
    expect(forecast.uv_risk(11)).to eq('Extreme')
    expect(forecast.uv_risk(13)).to eq('Extreme')
  end
end
