require 'topic'

describe Topic do
  describe '.message' do
    context 'for a string based topic' do

      it 'should return message' do
        message = 'greetings stringling'
        topic = described_class.new(message)

        expect(topic.message).to eql(message)
      end
    end

    context 'for a function based topic' do
      context 'proc' do
        it 'should return message' do
          message = 'greetings procling'
          method = Proc.new {message}

          topic = described_class.new(method)

          expect(topic.message).to eql(message)
        end
      end

      context 'inner function' do
        it 'should return message from function' do
          def yay
            'greetings innerling'
          end

          topic = described_class.new(method(:yay))

          expect(topic.message).to eql('greetings innerling')
        end
      end
    end
  end
end
