require 'rails_helper'

describe ForecastService do
  it 'turns lat/long into forecast in json' do
    service = ForecastService.new

    forecast = service.get_results({lat: 39.7392358, lng: -104.990251})
# require 'pry'; binding.pry
    expect(forecast).to have_key(:lat)
    expect(forecast).to have_key(:lng)
  end
end
