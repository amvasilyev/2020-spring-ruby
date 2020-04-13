# frozen_string_literal: true

# Describes the train
class Train
  attr_reader :id

  def initialize(id, stops = [])
    @id = id
    @stops = stops
  end

  def to_s
    "#{@stops.first} #{@stops.last}"
  end
end
