#link to the Bike class
require './lib/bike'

#We're describing the functionality of a specific class, in this case 'Bike'
describe Bike do

  let(:bike) {Bike.new}
	#this is a specific feature (behaviour) that we expect to be present
	it 'should not be broken after we create it' do
		#expect an instance of this class
		#a method "broken?" that should return false
		expect(bike).not_to be_broken
	end

  it 'should be able to break' do
    bike.break!
    expect(bike).to be_broken
  end

  it 'should be able to get fixed' do
  	bike.break!
  	bike.fix!
  	expect(bike).not_to be_broken
  end

end