module Lita
  module Handlers
    class Weather < Handler
      CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
      CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']

      route(/weather please/, :weather, command: true,
        help: { weather: 'weather please - replies with current weather for Sao Paulo, Brazil' })

      def weather(response)
        temperature, sensation = http.get("http://apiadvisor.climatempo.com.br/api/v1/weather/locale/#{CLIMATEMPO_CITY_CODE}/current?token=#{CLIMATEMPO_API_TOKEN}")
                                     .yield_self { |http_response| MultiJson.load(http_response.body) }
                                     .yield_self { |weather| [weather.dig("data", "temperature"), weather.dig("data", "temperature")]  }

      	response.reply(
          "Está fazendo #{temperature}˚C com aquela sensação térmica de #{sensation}˚C :smile:"
        )
      end

      Lita.register_handler(self)
    end
  end
end
