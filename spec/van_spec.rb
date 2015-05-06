require './lib/van.rb'

describe Van do

let(:van) {Van.new}
let(:broken_bike) {double :broken_bike, broken?: true}
let(:working_bike) {double :working_bike, broken?: false}
let(:station) {double :station, bikes: [broken_bike, broken_bike, broken_bike, working_bike]}
let(:released_bikes) {double :released_bikes, bikes: [broken_bike, broken_bike, broken_bike, working_bike]}

  it 'can release broken bikes from a broken bike station' do
    expect(station).to receive :release_broken_bikes
    van.collect_broken_bikes(station)
  end

  it 'can release working bikes to station' do
    van.dock(broken_bike)
    van.dock(working_bike)
    van.return_fixed_bikes(station)
    expect(van.bikes).to eq [broken_bike]
    expect(station).to receive(:dock).with(working_bike)
  end

end