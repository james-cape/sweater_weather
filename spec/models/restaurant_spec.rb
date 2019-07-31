require 'rails_helper'

describe Restaurant do
  it 'has attributes' do
    location = 'Pueblo, CO'

    attributes = [
      {
      :id=>'kQxM1xlaZfQmXpKaqMTNnw',
       :name=>'Wonderful Bistro',
       :location=>
        {
         :display_address=>[
           '4602 N Elizabeth St', 'Ste 120', 'Pueblo, CO 81008'
           ]
         },
        }
      ]

    restaurant = Restaurant.new(attributes, location)

    expect(restaurant.id).to eq(1)
    expect(restaurant.location).to eq('Pueblo, CO')
    expect(restaurant.restaurant_list[0].keys).to contain_exactly(:id, :name, :address)
    expect(restaurant.restaurant_list[0][:id].class).to eq(String)
    expect(restaurant.restaurant_list[0][:name].class).to eq(String)
    expect(restaurant.restaurant_list[0][:address].class).to eq(String)
  end
end
