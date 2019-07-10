# frozen_string_literal: true

class CurrentWeatherService
  CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
  CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']
	
  def self.execute
    new.send :current_weather
  end

  private

  def current_weather
    CurrentWeather.new(
      temperature: response.dig('data', 'temperature'),
      sensation: response.dig('data', 'sensation')
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
    "http://apiadvisor.climatempo.com.br/api/v1/weather/locale/#{CLIMATEMPO_CITY_CODE}/current?token=#{CLIMATEMPO_API_TOKEN}"
  end
end
