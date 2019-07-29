class Api::V1::MunchiesController < Api::V1::ApiBaseController

  def index
    # require 'pry'; binding.pry

    duration = DurationService.new.get_duration(params[:start], params[:end])

    restaurants = RestaurantService.new.get_restaurants(params, duration)

    render json: MunchiesSerializer.new(restaurants, params[:end]).find_restaurants

  end

  private

    # def location
    #   CoordinateService.new.get_results(params[:location])
    # end
    #
    # def unfiltered_forecast
    #   MunchiesService.new.get_results(location[:coordinates])
    # end
end
