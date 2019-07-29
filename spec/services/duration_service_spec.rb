require 'rails_helper'

describe DurationService do
  it 'returns duration of a trip from start to end' do
    service = DurationService.new

    images = service.get_results('denver,co', 1)

    # expect(images.class).to eq(Array)
    # expect(images[0].class).to eq(String)
    # expect(images[0]).to start_with("http")
  end
end
