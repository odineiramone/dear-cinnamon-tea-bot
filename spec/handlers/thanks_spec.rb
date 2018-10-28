require './handlers/thanks'

describe Lita::Handlers::Thanks, lita_handler: true do
  before do
    allow_any_instance_of(Array).to receive(:sample).and_return('Por nada!')
  end

  describe 'Ignore case sensitivity' do
    describe "when receives an 'thanks'" do
      it "prints a thanks quote" do
        send_command('thanks')
        expect(replies.last).to eq 'Por nada!'
      end
    end

    describe "when receives an 'Thanks'" do
      it "prints a thanks quote" do
        send_command('Thanks')
        expect(replies.last).to eq 'Por nada!'
      end
    end

    describe "when receives an 'THANKS'" do
      it "prints a thanks quote" do
        send_command('THANKS')
        expect(replies.last).to eq 'Por nada!'
      end
    end
  end
end
