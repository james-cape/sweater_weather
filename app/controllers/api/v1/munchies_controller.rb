class Api::V1::MunchiesController < Api::V1::ApiBaseController

  def index
    render json: MunchiesSerializer.new(restaurants)
  end

  private

    def duration
      DurationService.new.get_duration(params[:start], params[:end])
    end

    def restaurants
      restaurants = RestaurantService.new.get_restaurants(params, duration)[:businesses]
      Restaurant.new(restaurants, params[:end])
    end
end
