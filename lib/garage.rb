require_relative 'bike_container'

class Garage

  include BikeContainer

  def takes_broken_bikes(van)
    van.bikes.each do |bike|
      if bike.broken?
        bike.fix!
        self.dock(bike)
        van.release(brokenbike)
      end
    end
  end

end