class Restaurant
  attr_reader :id, :location, :restaurant_list

  def initialize(attributes, location)
    @attributes = attributes
    @location = location
    @id = 1
    @restaurant_list = restaurant_list
  end

  def restaurant_list
    @attributes.map do |attribute|
      {
        id: attribute[:id],
        name: attribute[:name],
        address: attribute[:location][:display_address][0]
      }
    end
  end
end
