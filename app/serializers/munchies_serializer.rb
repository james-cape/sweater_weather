class MunchiesSerializer

  def initialize(restaurants, destination)
    @restaurants = restaurants
    @destination = destination
  end

  def find_restaurants
    {
      end_city: @destination,
      restaurants: @restaurants
    }
  end
end
