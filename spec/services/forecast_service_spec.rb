require './app/models/forecast'
require './app/services/forecast_service'

describe ForecastService do
  subject { ForecastService }
  before do
    response = load_json 'weather/forecast.json'
    stub_forecast(response: response.to_json)
  end

  describe '#execute' do
    it 'returns a Forecast instance' do
      current_weather = subject.execute

      expect(current_weather).to be_a(Forecast)
    end
  end
end
