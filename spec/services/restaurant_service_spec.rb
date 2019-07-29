require 'rails_helper'

describe RestaurantService do
  it 'returns destination and three open restaurants at ETA' do
    service = RestaurantService.new

    duration = {
      text: "1 hour 47 mins",
      value: 6413
    }

    restaurant_params = {
      start: "denver,co",
      end: "pueblo,co",
      food: "chinese"
    }
    # restaurant_params = {
    #   "start"=>"denver,co",
    #   "end"=>"pueblo,co",
    #   "food"=>"chinese"
    # }

    duration = service.get_restaurants(restaurant_params, duration)

    expect(duration.class).to eq(Hash)
    expect(duration).to have_key(:text)
    expect(duration).to have_key(:value)
    expect(duration[:text].class).to eq(String)
    expect(duration[:value].class).to eq(Integer)
  end
end
