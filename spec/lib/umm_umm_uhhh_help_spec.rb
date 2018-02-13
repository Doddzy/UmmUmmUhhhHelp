require 'umm_umm_uhhh_help'

describe UmmUmmUhhhHelp do
  describe '.get_suggestion' do
    subject { described_class.get_suggestion }
    it "should return a suggestion" do
      expect(subject).to be_a(String)
    end
  end
end
