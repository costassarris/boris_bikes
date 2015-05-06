require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

  let(:bike) { double :bike, broken?: false }
  let(:broken_bike) { double :bike, broken?: true }
  let(:holder) { ContainerHolder.new}

  def fill_holder
    holder.capacity.times { holder.dock(bike)}
  end

  it 'should accept a bike' do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it 'should release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'should not release a bike if holder is empty' do
    expect{ holder.release(bike)}.to raise_error(RuntimeError, 'No bikes to release')
  end

  it 'should know when it\'s full' do
    expect(holder).not_to be_full
    fill_holder
    expect(holder).to be_full
  end

  it 'should not accept a bike if it\'s full' do
    fill_holder
    expect{ holder.dock(bike) }.to raise_error(RuntimeError, 'Holder is full')
  end

  it 'should provide the list of available bikes' do
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([bike])
  end

  it 'should release all broken bikes' do
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.release_broken_bikes).to eq [broken_bike]
  end
end