require 'yaml'
require 'erb'

class Category
  def initialize(name, topics = nil)
    @name = name
    @topics = topics || read_topics_from_file(name)
  end

  def random_topic
    @topics.sample
  end

  def name
    @name
  end

  def read_topics_from_file(category, file_location = 'data/topics.yml.erb')
    @data ||= YAML.load(ERB.new(File.read(File.join(__dir__, '../', file_location))).result)
    @data[category].map {|topic|
      Topic.new(topic)
    }
  end
end
