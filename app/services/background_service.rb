class BackgroundService

  def initialize; end

  def get_results(location)
    results = get_json("rest/", location)[:photos][:photo]
    results.map { |result| result[:url_o] }.compact!.first
  end

  private

  def get_json(path, location)
    response = conn(location).get(path)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(location)
    Faraday.new('https://www.flickr.com/services/') do |f|
      f.params['api_key'] = ENV['FLICKR_API_KEY']
      f.params['method'] = 'flickr.photos.search'
      f.params['nojsoncallback'] = '1'
      f.params['text'] = "#{location} downtown"
      f.params['format'] = 'json'
      f.params['sort'] = 'relevance'
      f.params['safe_search'] = '1'
      f.params['content_type'] = '1'
      f.params['media'] = 'photos'
      f.params['extras'] = 'url_o'
      f.params['per_page'] = '100'
      f.adapter Faraday.default_adapter
    end
  end
end
