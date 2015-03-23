require 'spec_helper' # obavezno sa sve spec's

describe Location do

  let (:latitude) { 44.816667 }
  let (:longitude) { 20.466667 }

  let (:air_space) { Location.new( latitude: 44.816667, longitude: 20.466667 ) }

  # BLOCK FORMA
  # let(:air_space) do
  #   Location.new do |loc|
  #     loc.latitude = 38.911268
  #     loc.longitude = -77.444243
  #   end
  #   loc.save # store it in the database
  #   loc # assign loc to variable air_space
  # end

  describe '#initialize' do
    subject { air_space }

    its (:latitude) { should eq latitude }
    its (:longitude) { should eq longitude }
  end

  describe '#near?' do

    context 'when within the specified radius' do
      subject { air_space }
      it { should be_near(latitude, longitude, 1) } # dinamicko be_nazivMetodaVar
    end

    context 'when outside the specified radius' do
      subject { air_space }
      it { should_not be_near(latitude * 10, longitude * 10, 1) }
    end

    context 'when negative radius is used' do
        it 'raises an error' do
          expect { air_space.near?(latitude, longitude, -1) }.to raise_error ArgumentError
        end
    end

  end

  describe "validation" do
    before { obj.valid? } # izvrsava se pre svakog testiranja u describe blocku, odnosi se na Location.new(.......), mora da se izvrsi da bi se pojavile greske

    # coordinate predstavalj :lat i :long ISTOVREMENO
    [:latitude, :longitude].each do |coordinate|

      context "when #{coordinate} is nil" do

        let (:obj) { Location.new(coordinate => nil) }
        subject { obj.errors.full_messages.to_s }

        # PRONACI NEKO ELEGANTNIJE RESENJE
        it { should include "can't be blank" }

        # # OVO NERADI (expect deo)
        # subject { Location.new(coordinate => nil) }
        #
        # it "shouldnt allow blank #{coordinate}" do
        #   expect (subject.errors_on(coordinate)).to include("can't be blank")
        # end
      end

      context "when #{coordinate} isn't numeric" do
        let (:obj) { Location.new(latitude: 'three', longitude: 'two') }
        subject { obj.errors.full_messages.to_s }

        # PRONACI NEKO ELEGANTNIJE RESENJE
        it { should include "is not a number" }
      end

    end

  end

end
