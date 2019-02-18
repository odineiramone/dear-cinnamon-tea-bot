module Lita
  module Handlers
    class Weather < Handler
      route(/previsao do tempo/, :weather, command: true,
        help: { weather: 'replies with current weather for Sao Paulo, Brazil' })

      def weather(response)
        current_weater = ::Weather.new
        current_weater.build_weather

      	response.reply(
          "Está fazendo #{current_weater.temperature}˚C com aquele gostinho de #{current_weater.sensation}˚C"
        )

        current_weater.save
      end

      Lita.register_handler(self)
    end
  end
end
