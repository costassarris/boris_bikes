class Bike

# def initialise(bike)
#   @broken = false
# end

# attr_accessor :broken

  def broken?
    @broken
  end

  def break!
    @broken = true
  end

  def fix!
  	@broken = false
  end
end