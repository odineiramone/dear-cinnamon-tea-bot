module Lita
  module Handlers
    class HelloLita < Handler
      route(/what do you want to do today?/, :take_over_the_world, command: true)

      def take_over_the_world(response)
      	response.reply(
          'The same thing we do every night... Try to take over the world!'
        )
      end

      Lita.register_handler(self)
    end
  end
end
