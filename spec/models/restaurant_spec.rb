require 'rails_helper'

describe Restaurant do
  it 'has attributes' do
    attributes = {
      :name=>"Wonderful Bistro",
      :location=>
        {
          :display_address=>["4602 N Eli St", "Ste 120", "Pueblo, CO 81008"]
        },
      }

    restaurant = Restaurant.new(attributes)

    expect(restaurant.name).to eq(attributes[:name])
    expect(restaurant.address).to eq(attributes[:location][:display_address].join(", "))
  end
end
