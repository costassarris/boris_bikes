module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    # if the capacity is reached, raise an exception
    raise "Holder is full" if full?
    bikes << bike
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes()
    bikes.reject {|bike| bike.broken?} #The reject method rejects any items that that meet the criteria set. In this case, it rejects any broken bikes, leaving only the available_bikes for output.
  end

end