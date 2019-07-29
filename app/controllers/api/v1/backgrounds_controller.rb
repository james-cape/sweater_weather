class Api::V1::BackgroundsController < Api::V1::ApiBaseController

  def index
    render json: BackgroundSerializer.new(images)
  end

  private

    def images
      BackgroundService.new.get_results(params[:location], 1)
    end
  #
  #   def unfiltered_forecast
  #     BackgroundService.new.get_results(location[:coordinates])
  #   end
end
