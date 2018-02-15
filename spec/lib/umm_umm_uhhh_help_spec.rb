require 'umm_umm_uhhh_help'

describe UmmUmmUhhhHelp do
  describe '.get_suggestion' do
    subject {described_class.get_suggestion}

    it 'should return a suggestion' do
      expect(subject).to be_a(String)
    end
  end

  describe '.get_cat_fact' do
    subject {described_class.get_cat_fact}

    it "should return a fact containing the word 'cat'" do
      fact = "Cats see six times better in the dark and at night than humans."
      json_fact = { fact: fact, length: 63 }.to_json

      stub_request(:get, "https://catfact.ninja/fact").to_return(body: json_fact)

      expect(subject).to eql(fact)
    end
  end
end
