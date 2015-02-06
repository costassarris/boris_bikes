require './lib/van.rb'

describe Van do

let(:van) {Van.new}
let(:broken_bike) {double :bike, broken?: true}
let(:working_bike) {double :bike, broken?: false}
let(:broken_bike_depot) {double :station, bikes: [broken_bike, broken_bike, broken_bike, working_bike]}

  it 'can release broken bikes from a broken bike depot' do
    expect(broken_bike_depot).to receive :release_broken_bikes
    broken_bike_depot.release_broken_bikes
  end

end