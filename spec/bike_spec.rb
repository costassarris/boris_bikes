#link to the Bike class
require 'bike'

#We're describing the functionality of a specific class, in this case 'Bike'
describe Bike do
	#this is a specific feature (behaviour) that we expect to be present
	it 'should not be broken after we create it' do
		the_bike = Bike.new #initialise any object of Bike class
		#expect an instance of this class
		#a method "broken?" that should return false
		expect(the_bike).not_to be_broken
	end

  it 'should be able to break' do
    bike = Bike.new
    bike.break!
    expect(bike).to be_broken
  end

  it 'should be able to get fixed' do
  	bike = Bike.new
  	bike.break!
  	bike.fix!
  	expect(bike).not_to be_broken
  end

end