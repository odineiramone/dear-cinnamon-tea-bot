require './app/handlers/hello_lita'

describe Lita::Handlers::HelloLita, lita_handler: true do
  it "prints Pink's classical quote" do
    send_command('o que você quer fazer hoje?')
    expect(replies.last).to(
      eq 'A mesma coisa que fazemos todas as noite... Tentar dominar o mundo!'
    )
  end
end
