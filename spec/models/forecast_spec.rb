require './app/models/forecast'

describe Forecast do
  let(:forecast_params) do
    {
      today: '28/10/2018',
      rain_probability: 0,
      temperature_max: 20,
      temperature_min: 15,
      summary: 'Sol com muitas nuvens durante o dia e períodos de céu nublado. Noite com muitas nuvens.'
    }
  end

  describe '#today' do
    describe 'given a date' do
      it 'returns the same date' do
        forecast = Forecast.new(forecast_params)
        expect(forecast.today).to eq('28/10/2018')
      end
    end
  end

  describe '#rain_probability' do
    describe 'given a value' do
      it 'returns the same value with percent sigh' do
        forecast = Forecast.new(forecast_params)
        expect(forecast.rain_probability).to eq('0%')
      end
    end
  end

  describe '#temperature_max' do
    describe 'given a value' do
      it 'returns the same value with degree sigh' do
        forecast = Forecast.new(forecast_params)
        expect(forecast.temperature_max).to eq('20˚')
      end
    end
  end

  describe '#temperature_min' do
    describe 'given a value' do
      it 'returns the same value with degree sigh' do
        forecast = Forecast.new(forecast_params)
        expect(forecast.temperature_min).to eq('15˚')
      end
    end
  end

    describe '#summary' do
    describe 'given a text' do
      it 'returns same text' do
        forecast = Forecast.new(forecast_params)
        expect(forecast.summary).to(
          eq('Sol com muitas nuvens durante o dia e períodos de céu nublado. Noite com muitas nuvens.')
        )
      end
    end
  end
end
