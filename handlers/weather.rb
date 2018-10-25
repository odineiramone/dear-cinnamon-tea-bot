module Lita
  module Handlers
    class Weather < Handler
      CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
      CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']

      route(/weather please/, :weather, command: true,
        help: { weather: 'replies with current weather for Sao Paulo, Brazil' })

      def weather(response)
        temperature, sensation = http.get("http://apiadvisor.climatempo.com.br/api/v1/weather/locale/#{CLIMATEMPO_CITY_CODE}/current?token=#{CLIMATEMPO_API_TOKEN}")
                                     .yield_self { |http_response| MultiJson.load(http_response.body) }
                                     .yield_self { |weather| [weather.dig("data", "temperature"), weather.dig("data", "temperature")]  }

        response.reply("Está fazendo #{temperature}˚C com aquela sensação térmica de #{sensation}˚C")

        forecasts_for_today = http.get("http://apiadvisor.climatempo.com.br/api/v1/forecast/locale/#{CLIMATEMPO_CITY_CODE}/days/15?token=#{CLIMATEMPO_API_TOKEN}")
                                  .yield_self { |http_response| MultiJson.load(http_response.body) }
                                  .yield_self { |forecasts| forecasts.fetch('data').first }

        rain_probability = forecasts_for_today.dig('rain', 'probability')
        temperature_max  = forecasts_for_today.dig('temperature', 'max')
        temperature_min  = forecasts_for_today.dig('temperature', 'min')

        summary_text          = forecasts_for_today.dig('text_icon', 'text', 'phrase', 'reduced')
        temperature_text      = "Temperaturas variando entre mínima de #{temperature_min}˚C e máxima de #{temperature_max}˚C"
        rain_probability_text = "Probabilidade de chuva em #{rain_probability}% 😄"

        response.reply(summary_text)
        response.reply(temperature_text)
        response.reply(rain_probability_text)
      end

      Lita.register_handler(self)
    end
  end
end
