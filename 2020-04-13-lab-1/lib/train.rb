# frozen_string_literal: true

# Describes the train
class Train
  attr_reader :id

  def initialize(id, stops = [])
    @id = id
    @stops = stops
  end

  def add_stop(stop)
    @stops.append(stop)
  end

  def to_s
    "#{@stops.first} #{@stops.last}"
  end

  def each_stop
    return enum_for(:each_stop) unless block_given?

    @stops.each do |stop|
      yield stop
    end
  end

  def stop_count
    @stops.length
  end
end
