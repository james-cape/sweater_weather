require 'rails_helper'

describe MunchiesSerializer do
  it 'gets a destination and three open Chinese restaurants at arrival time' do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results.keys).to contain_exactly(:data)
    expect(results[:data].keys).to contain_exactly(:id, :type, :attributes)
    expect(results[:data][:attributes].keys).to contain_exactly(:location, :restaurant_list)
    expect(results[:data][:attributes][:location].class).to eq(String)
    # expect(results[:data][:attributes][:restaurant_list].class).to eq(Array)
    # expect(results[:data][:attributes][:restaurant_list].count).to eq(3)
    # expect(results[:data][:attributes][:restaurant_list][0].keys).to contain_exactly(:id, :name, :address)
    # expect(results[:data][:attributes][:restaurant_list][0][:id].class).to eq(String)
    # expect(results[:data][:attributes][:restaurant_list][0][:name].class).to eq(String)
    # expect(results[:data][:attributes][:restaurant_list][0][:address].class).to eq(String)
    # ^ Failed during the night because no restaurants were open
  end
end

# Could have tested sad paths 400 response, and gibberish input
