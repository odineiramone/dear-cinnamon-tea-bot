module Lita
  module Handlers
    class Weather < Handler
      CLIMATEMPO_API_TOKEN = ENV['CLIMATEMPO_API_TOKEN']
      CLIMATEMPO_CITY_CODE = ENV['CLIMATEMPO_CITY_CODE']

      route(/weather please/, :weather, command: true,
        help: { weather: 'replies with current weather for Sao Paulo, Brazil' })

      def weather(response)
        @weather = WeatherService.execute
        @forecast = ForecastService.execute

        response.reply(title)
        response.reply(weather_text)
        response.reply(@forecast.summary)
        response.reply(temperature_text)
        response.reply(rain_probability_text)
      end

      Lita.register_handler(self)

      private

      def title
        "Previsão do tempo para #{@forecast.today}"
      end

      def weather_text
        "Está fazendo #{@weather.temperature}˚C com sensação térmica de #{@weather.sensation}˚C"
      end

      def temperature_text
        "Temperaturas variando entre mínima de #{@forecast.temperature_min}C e máxima de #{@forecast.temperature_max}C"
      end

      def rain_probability_text
        "Probabilidade de chuva em #{@forecast.rain_probability} 😄"
      end
    end
  end
end
