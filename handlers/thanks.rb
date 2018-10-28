module Lita
  module Handlers
    class Thanks < Handler
      # This '(?i)' makes the regex ignore case sensitivity
      route(/(?i)(many thanks|thanks|obrigado)/, :thanks, command: false,
            help: { thanks_return: "replies a random thanks" }
      )

      def thanks(response)
        thanks = [
          "You're welcome",
          'Is we on the tape 📼',
          'Por nada!',
          'É nozes! 😎',
          'É nóis nas 🍟',
          'É nóis memo vagabundo!'
        ]

        response.reply(thanks.sample)
      end

      Lita.register_handler(self)
    end
  end
end
