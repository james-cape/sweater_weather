require 'rails_helper'

describe CoordinateService do
  it 'turns city,state into lat/long' do
    service = CoordinateService.new

    latlong = service.get_results('denver,co')

    expect(latlong).to have_key(:lat)
    expect(latlong).to have_key(:lng)
  end
end
