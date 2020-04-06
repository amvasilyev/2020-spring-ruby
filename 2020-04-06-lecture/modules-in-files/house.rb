require_relative 'car'

module Application
  class House
    def initialize
      @car = Car.new
    end
  end
end

house = Application::House.new
