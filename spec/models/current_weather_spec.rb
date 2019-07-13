require './app/models/current_weather'

describe CurrentWeather do
  describe '#temperature' do
    describe 'given 17' do
      it 'returns 17' do
        current_weather = CurrentWeather.new(
          temperature: 17,
          sensation: 15
        )

        expect(current_weather.temperature).to eq(17)
      end
    end
  end

  describe '#sensation' do
    describe 'given 15' do
      it 'returns 15' do
        current_weather = CurrentWeather.new(
          temperature: 17,
          sensation: 15
        )

        expect(current_weather.sensation).to eq(15)
      end
    end
  end
end
