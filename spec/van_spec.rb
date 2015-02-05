require './lib/van.rb'

describe Van do

let (:van) {Van.new}
let (:broken_bike) {double :bike, broken?: true}
let (:working_bike) {double :bike, broken?: false}
let (:station) {double :bike_container, bikes: [working_bike, broken_bike] }

  it 'should pick up bikes if broken' do
    allow(station).to receive(:release)
    van.picks_up_broken_bikes(station)
    expect(van.bike_count).to eq(1)
  end

end