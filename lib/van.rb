require_relative 'bike_container'

class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def collect_broken_bikes(station)
    station.bikes.each do |bike|
      self.dock(bike) if bike.broken?
    end
    station.release_broken_bikes
  end

  def return_fixed_bikes(station)
    self.release_fixed_bikes.each do |bike|
      station.dock(bike)
    end
  end

end