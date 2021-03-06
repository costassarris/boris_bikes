require '.lib/docking_station'

describe DockingStation do

let(:bike) {Bike.new}
let(:station) {DockingStation.new(capacity: 20)}

    def fill_station
      20.times { station.dock(Bike.new) }
    end

  it 'should accept a bike' do
    bike = Bike.new
    station = DockingStation.new
    # we expect the station to have 0 bikes
    expect(station.bike_count).to eq(0)
    # let's dock a bike into the station
    station.dock(bike)
    # now we expect the station to have 1 bike
    expect(station.bike_count).to eq(1)
  end

  it 'should release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it 'should know when it\'s full' do
    expect(station).not_to be_full
      fill_station
    expect(station).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_station
    expect{ station.dock(bike) }.to raise_error(RuntimeError, 'Station is full')
  end

  it 'should provide the list of available bikes' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end

end