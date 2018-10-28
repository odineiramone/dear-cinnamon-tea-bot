# frozen_string_literal: true

module ClientHelper
  CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
  CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']

  def stub_weather(options)
    url = "http://apiadvisor.climatempo.com.br/api/v1/weather/locale/#{CLIMATEMPO_CITY_CODE}/current?token=#{CLIMATEMPO_API_TOKEN}"
    stub_get(url, options[:response], options[:status])
  end

  def stub_forecast(options)
    url = "http://apiadvisor.climatempo.com.br/api/v1/forecast/locale/#{CLIMATEMPO_CITY_CODE}/days/15?token=#{CLIMATEMPO_API_TOKEN}"
    stub_get(url, options[:response], options[:status])
  end

  private

  def stub_get(url, response, status)
    stub_request(:get, url)
      .and_return(
        headers: { content_type: 'application/json' },
        body: response || '',
        status: status || 200
      )
  end
end
