# frozen_string_literal: true

class Forecast
  attr_reader :today, :rain_probability, :temperature_max,
              :temperature_min, :summary
  
  def initialize(today:, rain_probability:, temperature_max:,
                 temperature_min:, summary:)
    
    @today            = today
    @rain_probability = add_percent_sign(rain_probability)
    @temperature_max  = add_degree_sign(temperature_max)
    @temperature_min  = add_degree_sign(temperature_min)
    @summary          = summary
  end

  private

  def add_percent_sign(value)
    add_sign_to_value('%', value.to_s)
  end

  def add_degree_sign(value)
    add_sign_to_value('˚', value.to_s)
  end

  def add_sign_to_value(sign, value)
    value[-1] == sign ? value : value + sign
  end
end
