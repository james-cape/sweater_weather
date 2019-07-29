class MunchiesSerializer

  def initialize(restaurants, destination)
    @restaurants = restaurants
    @destination = destination
  end

  def find_munchies
    {
      end_city: @destination,
      restaurants: @restaurants
    }
  end
end
