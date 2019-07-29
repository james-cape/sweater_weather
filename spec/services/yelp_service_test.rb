require 'rails_helper'

describe YelpService do
  it '                             ' do
    service = YelpService.new

    location = service.get_results('new york')
    # location = service.get_results('denver,co')

    expect(location).to have_key(:citystate)
    expect(location).to have_key(:country)
    expect(location).to have_key(:coordinates)
    expect(location[:coordinates]).to have_key(:lat)
    expect(location[:coordinates]).to have_key(:lng)
  end
end
