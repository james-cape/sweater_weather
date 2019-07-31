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

    expect(restaurants.class).to eq(Hash)
    expect(restaurants[:businesses].class).to eq(Array)

    # expect(restaurants[:businesses][0].keys).to include(:id, :name, :location)
    # expect(restaurants[:businesses][0][:id].class).to eq(String)
    # expect(restaurants[:businesses][0][:name].class).to eq(String)
    # expect(restaurants[:businesses][0][:location].keys).to include(:display_address)
    # expect(restaurants[:businesses][0][:location][:display_address].class).to eq(Array)
    # expect(restaurants[:businesses][0][:location][:display_address][0].class).to eq(String)
# ^^ Closed for the night??

  end
end
