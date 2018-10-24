module Lita
  module Handlers
    class Weather < Handler
      CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
      CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']
      HOURS_PER_DAY = 24

      route(/weather please/, :weather, command: true,
        help: { weather: 'replies with current weather for Sao Paulo, Brazil' })

      def weather(response)
        temperatures_for_today = http.get("http://apiadvisor.climatempo.com.br/api/v1/forecast/locale/#{CLIMATEMPO_CITY_CODE}/hours/72?token=#{CLIMATEMPO_API_TOKEN}")
                                     .yield_self { |http_response| MultiJson.load(http_response.body) }
                                     .yield_self { |forecasts| forecasts.fetch('data').first(HOURS_PER_DAY) }
                                     .map        { |forecasts_for_today| forecasts_for_today.dig('temperature', 'temperature') }

        min, max = temperatures_for_today.minmax

        temperature, sensation = http.get("http://apiadvisor.climatempo.com.br/api/v1/weather/locale/#{CLIMATEMPO_CITY_CODE}/current?token=#{CLIMATEMPO_API_TOKEN}")
                                     .yield_self { |http_response| MultiJson.load(http_response.body) }
                                     .yield_self { |weather| [weather.dig("data", "temperature"), weather.dig("data", "temperature")]  }

        response.reply("Está fazendo #{temperature}˚C com aquela sensação térmica de #{sensation}˚C")
        response.reply("Hoje está previsto mínima de #{min}˚C e máxima de #{max}˚C 😄")
      end

      Lita.register_handler(self)
    end
  end
end
