require './app/models/weather'
require './app/services/weather_service'

describe WeatherService do
  subject { WeatherService }
  before do
    response = load_json 'weather/weather.json'
    stub_weather(response: response.to_json)
  end

  describe '#execute' do
    it 'returns a Weather instance' do
      current_weather = subject.execute

      expect(current_weather).to be_a(Weather)
    end
  end
end
