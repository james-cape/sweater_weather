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
    first_restaurant = restaurants[:businesses][0]

    expect(restaurants.class).to eq(Hash)
    expect(restaurants[:businesses].class).to eq(Array)

    expect(first_restaurant.keys).to include(:id, :name, :location)
    expect(first_restaurant[:id].class).to eq(String)
    expect(first_restaurant[:name].class).to eq(String)
    expect(first_restaurant[:location].keys).to include(:display_address)
    expect(first_restaurant[:location][:display_address].class).to eq(Array)
    expect(first_restaurant[:location][:display_address][0].class).to eq(String)
  end
end
