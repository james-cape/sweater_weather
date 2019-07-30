class Api::V1::MunchiesController < Api::V1::ApiBaseController

  def index
    render json: MunchiesSerializer.new(restaurants, params[:end]).find_munchies
  end

  private

    def duration
      DurationService.new.get_duration(params[:start], params[:end])
    end

    def restaurants
      restaurants = RestaurantService.new.get_restaurants(params, duration)[:businesses]

      restaurants.map do |restaurant|
        Restaurant.new(restaurant)
      end
    end
end
