require_relative 'bike_container'

class Garage

  include BikeContainer

  def takes_broken_bikes(van)
    van.bikes.each do |brokenbike|
      if brokenbike.broken?
        brokenbike.fix!
        dock(brokenbike)
        van.release(brokenbike)
      end
    end
  end

end