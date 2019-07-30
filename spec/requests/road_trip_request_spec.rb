require 'rails_helper'

describe 'road trip' do
  describe 'as an authenticated user' do
    it 'delivers a forecast for a location at an arrival time' do

      params = {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      post '/api/v1/road_trip', params: params

      expect(response).to be_successful

      results = JSON.parse(response.body, symbolize_names: true)

      expect(results.keys).to contain_exactly(
        :temperature,
        :forecast_summary,
        :estimated_travel_time
      )

      expect(results[:temperature].class).to eq(Float)
      expect(results[:forecast_summary].class).to eq(String)

      expect(results[:estimated_travel_time].keys).to contain_exactly(
        :hours,
        :minutes
      )
      
      expect(results[:estimated_travel_time][:hours].class).to eq(String)
      expect(results[:estimated_travel_time][:minutes].class).to eq(String)
    end
  end

  describe 'as an unauthenticated user' do
    it 'returns a 404' do

      params = {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: nil
      }

      post '/api/v1/road_trip', params: params

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end
