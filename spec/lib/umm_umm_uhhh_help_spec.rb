require 'umm_umm_uhhh_help'

describe UmmUmmUhhhHelp do
  stubbed_external_fact = 'Cats see six times better in the dark and at night than humans.'

  before do
    json_fact = { fact: stubbed_external_fact, length: 63 }.to_json

    stub_request(:get, 'https://catfact.ninja/fact').to_return(body: json_fact)
  end

  describe '.get_topic' do
    let(:category_index) {'default'}

    subject {described_class.get_topic(category_index)}

    it 'should default to mastercard when given unknown index' do
      expect(subject).to eq('Mastercard')
    end

    context 'category 1' do
      let(:category_index) {'1'}

      it 'should return a Space topic' do
        expect(subject).to start_with('Space: ')
        expect(subject.length).to be > 7
      end
    end

    context 'category 2' do
      let(:category_index) {'2'}

      it 'should return a compliment topic' do
        expect(subject).to start_with('Compliment: ')
        expect(subject.length).to be > 12
      end
    end

    context 'category 3' do
      let(:category_index) {'3'}

      it 'should return a Fact topic' do
        expect(subject).to start_with('Fact: ')
        expect(subject.length).to be > 6
      end
    end
  end

  describe '.get_cat_fact' do
    subject {described_class.get_cat_fact}

    it 'should return stubbed cat fact' do
      expect(subject).to eql(stubbed_external_fact)
    end
  end
end
