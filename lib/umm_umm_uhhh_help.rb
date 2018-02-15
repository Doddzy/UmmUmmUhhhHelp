require 'httparty'

require_relative 'topic'

module UmmUmmUhhhHelp
  def self.run
    puts get_suggestion
  end

  def self.topics
    [
      Topic.new('Do you think space tourism will be big in the near future? Why or why not?'),
      Topic.new("Talk about how cute #{`whoami`.chomp} is"),
      Topic.new(method(:get_cat_fact))
    ]
  end

  def self.get_suggestion
    selected_topic = topics.sample

    selected_topic.message
  end

  def self.get_cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    data = JSON.parse(response.body)
    data['fact']
  end
end
