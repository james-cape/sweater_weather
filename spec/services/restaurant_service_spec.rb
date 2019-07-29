require 'rails_helper'

describe RestaurantService do
  it 'returns destination and three open restaurants at ETA' do
    service = RestaurantService.new

    duration = service.get_restaurants('denver,co', 'pueblo,co', )

    expect(duration.class).to eq(Hash)
    expect(duration).to have_key(:text)
    expect(duration).to have_key(:value)
    expect(duration[:text].class).to eq(String)
    expect(duration[:value].class).to eq(Integer)
  end
end
