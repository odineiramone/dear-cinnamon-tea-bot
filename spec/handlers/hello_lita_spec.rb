require './handlers/hello_lita'

describe Lita::Handlers::HelloLita, lita_handler: true do
  it "prints Pink's classical quote" do
    send_command('what do you want to do today?')
    expect(replies.last).to(
      eq 'The same thing we do every night... Try to take over the world!'
    )
  end
end
