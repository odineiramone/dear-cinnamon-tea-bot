# frozen_string_literal: true

class ForecastService
  CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
  CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']
	
  def self.execute
    new.send :forecast
  end

  private

  def forecast
    forecast = response.dig('data').first

    Forecast.new(
      today: forecast.fetch('date_br'),
      rain_probability: forecast.dig('rain', 'probability'),
      temperature_max: forecast.dig('temperature', 'max'),
      temperature_min: forecast.dig('temperature', 'min'),
      summary: forecast.dig('text_icon', 'text', 'phrase', 'reduced')
    )
  end

  def response
    MultiJson.load(provider_call.body)
  end

  def provider_call
    @provider_call ||= client.get
  end

  def client
    Faraday.new endpoint
  end

  def endpoint
    "http://apiadvisor.climatempo.com.br/api/v1/forecast/locale/#{CLIMATEMPO_CITY_CODE}/days/15?token=#{CLIMATEMPO_API_TOKEN}"
  end
end
