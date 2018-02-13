require 'umm_umm_uhhh_help'

describe UmmUmmUhhhHelp do

  describe '.run_example' do
    subject { described_class.run_example }
    it "should return a 7" do
      expect(subject).to eq(7)
    end
  end
end
