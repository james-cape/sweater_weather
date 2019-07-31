require 'rails_helper'

describe 'coordinates API' do
  it 'gets a forecast for the city and state' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast.keys).to contain_exactly(
      :snapshot,
      :details,
      :hourly_data,
      :daily_data
    )

    expect(forecast[:snapshot].keys).to contain_exactly(
      :summary,
      :temperature,
      :temperature_high,
      :temperature_low,
      :city_state,
      :country,
      :time_date
    )

    expect(forecast[:details].keys).to contain_exactly(
      :short_summary,
      :long_summary,
      :apparent_temperature,
      :humidity,
      :visibility,
      :uv_index
    )

    expect(forecast[:hourly_data].keys).to contain_exactly(
      :temperature
    )

    expect(forecast[:daily_data].keys).to contain_exactly(
      :icon,
      :precip_probability,
      :temperature_high,
      :temperature_low
    )

    expect(forecast[:hourly_data][:temperature].length).to eq(8)
    expect(forecast[:daily_data][:icon].length).to eq(5)
  end

  it 'generates risk profiles based on uv_index' do
    test_serializer = ForecastSerializer.new("1", "2")
    
    expect(test_serializer.uv_risk(0)).to eq('Low')
    expect(test_serializer.uv_risk(1)).to eq('Low')
    expect(test_serializer.uv_risk(3)).to eq('Moderate')
    expect(test_serializer.uv_risk(5)).to eq('Moderate')
    expect(test_serializer.uv_risk(6)).to eq('High')
    expect(test_serializer.uv_risk(7)).to eq('High')
    expect(test_serializer.uv_risk(8)).to eq('Very High')
    expect(test_serializer.uv_risk(10)).to eq('Very High')
    expect(test_serializer.uv_risk(11)).to eq('Extreme')
    expect(test_serializer.uv_risk(13)).to eq('Extreme')
  end
end
