class Api::V1::MunchiesController < Api::V1::ApiBaseController

  def index
    # require 'pry'; binding.pry

    duration = DurationService.new(params[:start], params[:end])

    # render json: MunchiesSerializer.new(unfiltered_forecast,
                                               # location[:citystate],
                                               # location[:country])
                                               # .forecast_all
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