require 'dotenv/load'

require 'active_record'

require './app/handlers/hello_lita.rb'
require './app/handlers/weather.rb'

require './app/models/weather.rb'

template = ERB.new(File.new('./config/database.yml').read)
db_yaml = YAML.load(template.result(binding))
ActiveRecord::Base.establish_connection(db_yaml[ENV['CURRENT_ENV']])

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
