require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station is full'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it { is_expected.to respond_to :release_bike }

     it 'releases working bikes' do
       subject.dock double(:bike, broken?: false, working?: true)
       bike = subject.release_bike
       expect(bike).to be_working
     end

     it 'does not release broken bikes' do
       bike = double(:bike, broken?: false)
       expect {subject.release_bike}.to raise_error 'No bikes available'
 end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
end

describe '#dock' do
  it 'raises an error when docking station is full' do
    subject.capacity.times { subject.dock double(:bike) }
    expect { subject.dock double(:bike) }.to raise_error "Docking station is full"
  end
end


end
