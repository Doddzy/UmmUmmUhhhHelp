require 'umm_umm_uhhh_help'

describe UmmUmmUhhhHelp do
  describe '.get_suggestion' do
    subject { described_class.get_suggestion }

    it "should return a suggestion" do
      expect(subject).to be_a(String)
    end
  end

  describe '.get_cat_fact' do
    subject { described_class.get_cat_fact }

    it "should return a fact containing the word 'cat'" do
      expect(subject).to include('cat')
    end
  end
end
