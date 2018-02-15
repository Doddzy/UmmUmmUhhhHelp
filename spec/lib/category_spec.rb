require 'category'
require 'topic'

describe Category do
  test_yml_file = YAML.load_file('spec/data/test_topics.yml')

  describe '.random_topic' do
    context 'from_file' do
      context 'Category with single topic' do
        subject {described_class.new('Test').random_topic}

        it 'should return test categories only topic' do
          allow(YAML).to receive(:load).and_return(test_yml_file)

          expected_topic_message = 'What is the funniest name you have actually heard used in the real world?'

          expect(subject.message).to eql(expected_topic_message)
        end
      end

      context 'Category with multiple topics' do
        subject {described_class.new('Another').random_topic.message}

        it 'should return test categories only topic' do
          allow(YAML).to receive(:load).and_return(test_yml_file)

          expect(test_yml_file['Another'].include?(subject)).to be(true)
        end
      end
    end

    context 'when given topics' do
      topics = ['1', 'g', 'h'].map {|t| Topic.new(t)}
      subject {described_class.new('Yay', topics).random_topic}

      it 'should return one of the given topics' do
        expect(topics).to include(subject)
      end
    end
  end
end
