class Api::V1::MunchiesController < Api::V1::ApiBaseController

  def index
    render json: MunchiesSerializer.new(restaurants)
  end

  private

    def duration
      @duration ||= DurationService.new.get_duration(params[:start], params[:end])
    end

    def restaurants
      @results ||= RestaurantService.new.get_restaurants(params, duration)[:businesses]
      Restaurant.new(@results, params[:end])
    end
end
