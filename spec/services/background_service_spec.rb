require 'rails_helper'

describe BackgroundService do
  it 'returns images of the searched-for city' do
    service = BackgroundService.new

    image = service.get_results('denver,co')

    expect(image.class).to eq(String)
    expect(image).to start_with("http")
  end
end
