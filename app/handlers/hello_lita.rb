module Lita
  module Handlers
    class HelloLita < Handler
      route(/o que você quer fazer hoje?/, :take_over_the_world)

      def take_over_the_world(response)
      	response.reply(
          'A mesma coisa que fazemos todas as noite... Tentar dominar o mundo!'
        )
      end

      Lita.register_handler(self)
    end
  end
end
