require 'rails_helper'

describe DurationService do
  it 'returns duration of a trip from start to end' do
    service = DurationService.new

    duration = service.get_duration('denver,co', 'pueblo,co')

    expect(duration.class).to eq(Hash)
    expect(duration).to have_key(:text)
    expect(duration).to have_key(:value)
    expect(duration[:text].class).to eq(String)
    expect(duration[:value].class).to eq(Integer)
  end
end
