# frozen_string_literal: true

require 'csv'

require_relative 'train_list'
require_relative 'train'
require_relative 'stop'

# Module reads CSV data into files
module DataReader
  STATIONS_FILE = File.expand_path('../data/stations.csv', __dir__)
  STOPS_FILE = File.expand_path('../data/stops.csv', __dir__)

  def self.read_trains
    stations = read_stations
    read_stops(stations)
  end

  def self.read_stations
    stations = {}
    CSV.foreach(STATIONS_FILE, headers: true) do |row|
      stations[row['CODE']] = row['TITLE'].strip
    end
    stations
  end

  def self.read_stops(stations)
    train_list = TrainList.new
    last_train = Train.new(-1)
    CSV.foreach(STOPS_FILE, headers: true) do |row|
      if row['TRAINID'].to_i != last_train.id
        last_train = Train.new(row['TRAINID'].to_i)
        train_list.add_train(last_train)
      end
      last_train.add_stop(Stop.new(
                            row['NUMBER'], stations[row['STATION_CODE']], row['ARRIVAL_TIME'],
                            row['STOP_DURATION'], row['DISTANCE']
                          ))
    end
    train_list
  end
end
