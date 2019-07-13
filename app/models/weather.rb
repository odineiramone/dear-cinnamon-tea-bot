# frozen_string_literal: true

class Weather
  attr_reader :temperature, :sensation

  def initialize(temperature:, sensation:)
    @temperature = temperature
    @sensation = sensation
  end
end
