# frozen_string_literal: true

# Holds a list of trains
class TrainList
  def initialize(trains = [])
    @trains = trains
  end

  def add_train(train)
    @trains.append(train)
  end

  def each_train
    @trains.each do |train|
      yield train
    end
  end

  def each_train_by_length
    @trains.sort_by(&:stop_count).each do |train|
      yield train
    end
  end
end
