require 'rails_helper'

describe CoordinateService do
  it 'turns city,state into lat/long' do
    VCR.use_cassette("services/find_coordinates_for_location") do
      service = CoordinateService.new

      location = service.get_results('denver,co')

      expect(location).to have_key(:citystate)
      expect(location).to have_key(:country)
      expect(location).to have_key(:coordinates)
      expect(location[:coordinates]).to have_key(:lat)
      expect(location[:coordinates]).to have_key(:lng)
    end
  end
end
