class Weather < ActiveRecord::Base
  CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
  CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']

  def build_weather
    self.temperature = current_temperature
    self.sensation   = current_sensation
    self
  end

  private

  def current_temperature
    @current_temperature ||= current_weather.dig("data", "temperature")
  end

  def current_sensation
    @current_sensation ||= current_weather.dig("data", "sensation")
  end

  def current_weather
    response = Faraday.get "http://apiadvisor.climatempo.com.br/api/v1/weather/locale/#{CLIMATEMPO_CITY_CODE}/current?token=#{CLIMATEMPO_API_TOKEN}"
    @current_weather ||= MultiJson.load(response.body)
  end
end
