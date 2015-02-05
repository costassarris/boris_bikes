require_relative 'bike_container'

class Van

  include BikeContainer

  def picks_up_broken_bikes(station)
    station.bikes.each do |bike|
      if bike.broken?
       dock(bike)
       station.release(bike)
      end
    end
  end

end