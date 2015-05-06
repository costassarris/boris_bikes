require 'garage'

  describe Garage do

  let(:garage) {Garage.new}
  let(:broken_bike) {double :bike, broken?: true}
  let(:working_bike) {double :bike, broken?: false}
  let(:van) {double :bike_container, bikes: [broken_bike]}

  xit 'should receive and fix broken bikes' do
    allow(van).to receive(:release)
    garage.takes_broken_bikes(van)
    expect(garage.bike_count).to eq(1)
    expect(van.bike_count).to eq(0)
    expect(garage.bikes.broken?).to eq false
  end

end