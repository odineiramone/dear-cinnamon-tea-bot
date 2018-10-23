module Lita
  module Handlers
    class HelloLita < Handler
      route(/what do you want to do today?/, :take_over_the_world, command: true,
            help: { pink: "what do you want to do today? - replies with Pink's classic quote" }
      )

      def take_over_the_world(response)
      	response.reply(
          'The same thing we do every night... Try to take over the world!'
        )
      end

      Lita.register_handler(self)
    end
  end
end
