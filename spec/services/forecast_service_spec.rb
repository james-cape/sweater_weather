require 'rails_helper'

describe ForecastService do
  it 'turns lat/long into forecast in json' do
    service = ForecastService.new

    location = {
      coordinates: {
        lat: 39.7392358, lng: -104.990251
      }
    }

    forecast = service.get_results(location[:coordinates])

    expect(forecast[:currently]).to have_key(:summary)
    expect(forecast[:currently]).to have_key(:temperature)

    expect(forecast[:hourly][:data][0]).to have_key(:apparentTemperature)
    expect(forecast[:hourly][:data][0]).to have_key(:temperature)

    expect(forecast[:daily][:data][0]).to have_key(:temperatureHigh)
    expect(forecast[:daily][:data][0]).to have_key(:temperatureLow)
    expect(forecast[:daily][:data][0]).to have_key(:humidity)
    expect(forecast[:daily][:data][0]).to have_key(:visibility)
    expect(forecast[:daily][:data][0]).to have_key(:uvIndex)
    expect(forecast[:daily][:data][0]).to have_key(:precipProbability)
    expect(forecast[:daily][:data][0]).to have_key(:icon)
    expect(forecast[:daily][:data][0]).to have_key(:summary)
  end
  # it 'generates risk profiles based on uv_index' do
  #   # {
  #   #   :details=>{
  #   #     :uv_index=>"7 (High)"
  #   #     }
  #   #   }
  # end
  # it "returns the specified value" do
  #   uv_index = double("receiver")
  #   receiver.stub(:message) { :return_value }
  #   expect(receiver.message).to eq(:return_value)
  # end
  # it "returns the specified value" do
  #   receiver = double("receiver")
  #   receiver.stub(:message) { :return_value }
  #   require 'pry'; binding.pry
  #   expect(receiver.message).to eq(:return_value)
  # end
end
