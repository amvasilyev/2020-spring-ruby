# frozen_string_literal: true

# Holds a list of trains
class TrainList
  def initialize(trains = [])
    @trains = trains
  end

  def each_train
    @trains.each do |train|
      yield train
    end
  end
end
