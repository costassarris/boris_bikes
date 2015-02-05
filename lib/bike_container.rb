module BikeContainer

  DEFAULT_CAPACITY = 10

  # attr_reader :bikes ||= []

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
    raise "Holder is full" if full?
    bikes << bike
  end

  def release(bike)
    raise "No bikes to release" if empty?
    bikes.delete(bike)
  end

  def empty?
    bike_count == 0
  end

  def full?
    bike_count == capacity
  end

  def available_bikes()
    bikes.reject {|bike| bike.broken?}
  end

end



