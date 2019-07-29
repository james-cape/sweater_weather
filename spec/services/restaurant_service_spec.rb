require 'rails_helper'

describe RestaurantService do
  it 'returns three open restaurants at ETA' do
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

    restaurants = service.get_restaurants(restaurant_params, duration)

    expect(restaurants.class).to eq(Array)
    expect(restaurants.count).to eq(3)
    expect(restaurants[0].keys).to contain_exactly(:name, :address)
    expect(restaurants[0][:name].class).to eq(String)
    expect(restaurants[0][:address].class).to eq(String)
  end
end
