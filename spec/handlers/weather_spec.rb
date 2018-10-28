require './handlers/weather'

describe Lita::Handlers::Weather, lita_handler: true do
  before do
    response = load_json 'weather/weather.json'
    stub_weather(response: response.to_json)

    response = load_json 'weather/forecast.json'
    stub_forecast(response: response.to_json)
  end

  it "prints weather" do
    response = [
      'Previsão do tempo para 28/10/2018',
      'Está fazendo 16˚C com sensação térmica de 16˚C',
      'Sol com muitas nuvens durante o dia e períodos de céu nublado. Noite com muitas nuvens.',
      'Temperaturas variando entre mínima de 15˚C e máxima de 20˚C',
      'Probabilidade de chuva em 0% 😄'
    ]

    send_command('weather please')
    expect(replies).to eq response
  end
end
