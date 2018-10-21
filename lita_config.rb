require 'dotenv/load'

require './handlers/hello_lita.rb'
require './handlers/weather.rb'

Lita.configure do |config|
  config.robot.name = 'Dear Cinnamon Tea'
  config.robot.log_level = :info

  config.robot.adapter = ENV['ADAPTER'].to_sym
  config.adapters.telegram_plus.token = ENV['TELEGRAM_TOKEN'].to_s

  if ENV['REDISTOGO_URL']
    config.redis[:url] = ENV['REDISTOGO_URL']
  end

  if ENV['PORT']
    config.http.port = ENV['PORT']
  end

  config.handlers.giphy.api_key = ENV['GIPHY_API_KEY']
  config.handlers.giphy.rating = ENV['GIPHY_RATING']
end
