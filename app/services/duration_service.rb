class DurationService

  def initialize; end #Don't need this at all here

  def get_duration(start, finish)
    data = {
      start: start,
      finish: finish
    }
    get_json("directions/json", data)[:routes][0][:legs][0][:duration]
  end

  private

    def get_json(path, data) #This would be a good use for a module (Application Controller would be too widespread)
      response = conn(data).get(path)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn(data)
      Faraday.new('https://maps.googleapis.com/maps/api/') do |f|
        f.params['origin'] = data[:start]
        f.params['destination'] = data[:finish]
        f.params['key'] = ENV['GEOCODE_GOOGLE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end
end
