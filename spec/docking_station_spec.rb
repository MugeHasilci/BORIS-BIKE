require 'docking_station'

describe DockingStation do

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
end

  it { is_expected.to respond_to(:dock).with(1).argument }
  it 'docking station docks bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'raises an error when docking station is full' do
    subject.dock(Bike.new)
    expect { subject.dock Bike.new }. to raise_error "Docking station is full" 
  end
end
