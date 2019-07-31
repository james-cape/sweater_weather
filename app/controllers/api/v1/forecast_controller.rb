class Api::V1::ForecastController < Api::V1::ApiBaseController

  def show
    render json: ForecastSerializer.new(unfiltered_forecast,
                                               location[:citystate],
                                               location[:country])
                                               .forecast_all
  end

  private

    def location
      @location ||= CoordinateService.new.get_results(params[:location])
    end

    def unfiltered_forecast
      @unfiltered_forecast ||= ForecastService.new.get_results(location[:coordinates])
    end
end
