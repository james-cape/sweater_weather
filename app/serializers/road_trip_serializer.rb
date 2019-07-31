class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :temperature, :forecast_summary, :estimated_travel_time
end
