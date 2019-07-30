require 'rails_helper'

describe MunchiesSerializer do
  it 'gets a destination and three open Chinese restaurants at arrival time' do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results.keys).to contain_exactly(:end_city, :restaurants)
    expect(results.class).to eq(Hash)
    expect(results[:end_city].class).to eq(String)
    expect(results[:restaurants].class).to eq(Array)
    expect(results[:restaurants].count).to eq(3)
    expect(results[:restaurants][0].keys).to contain_exactly(:name, :address)
    expect(results[:restaurants][0][:name].class).to eq(String)
    expect(results[:restaurants][0][:address].class).to eq(String)
  end
end

# Could have tested sad paths 400 response, and gibberish input 
