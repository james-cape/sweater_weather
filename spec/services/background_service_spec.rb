require 'rails_helper'

describe BackgroundService do
  it 'returns images of the searched-for city' do
    service = BackgroundService.new

    images = service.get_results('denver,co', 1)

    expect(images.class).to eq(Array)
    expect(images[0].class).to eq(String)
    expect(images[0]).to start_with("http")
  end
end
