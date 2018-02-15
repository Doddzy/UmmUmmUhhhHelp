class Category
  def initialize(name, topics)
    @name = name
    @topics = topics
  end

  def random_topic
    @topics.sample
  end

  def name
    @name
  end
end
