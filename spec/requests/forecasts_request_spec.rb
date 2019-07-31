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
end
