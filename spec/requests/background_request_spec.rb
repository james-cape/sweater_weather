require 'rails_helper'

describe 'background image API' do
  it 'gets a background image for the city and state' do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image.keys).to contain_exactly(
      :background_image
      # :snapshot,
      # :details,
      # :hourly_data,
      # :daily_data
    )
  end
end
