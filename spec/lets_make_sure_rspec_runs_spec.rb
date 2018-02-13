require 'umm_umm_uhhh_help'

describe UmmUmmUhhhHelp do

  describe '.run_example' do
    subject { described_class.run_example }
    it "should return a 7" do
      expect(subject).to eq(7)
    end
  end

  describe '.get_suggestion' do
    subject { described_class.get_suggestion }
    it "should return a suggestion" do
      expect(subject).to be_a(String)
    end
  end
end
