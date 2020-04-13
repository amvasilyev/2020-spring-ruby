# frozen_string_literal: true

# The description of the stop
class Stop
  attr_reader :arrival_time
  attr_reader :distance
  attr_reader :duration
  attr_reader :number
  attr_reader :station

  def initialize(number, station, arrival_time, duration, distance)
    @number = number
    @station = station
    @arrival_time = arrival_time
    @duration = duration
    @distance = distance
  end

  def to_s
    "#{@station}(#{@arrival_time})"
  end
end
