require 'httparty'
require 'rss'
require 'nokogiri'

require_relative 'topic'
require_relative 'category'

module UmmUmmUhhhHelp
  def self.run
    category = choose_category

    puts get_topic(category)
  end

  def self.choose_category
    puts 'What type of topic would you like today?'
    puts '1: Space'
    puts '2: Compliments'
    puts '3: Weird questions'
    puts '4: Facts'
    puts '5: Words'

    STDIN.gets.chomp
  end

  def self.get_topic(category)
    category = {
      '1' => Category.new('Space'),
      '2' => Category.new('Compliments'),
      '3' => Category.new('Weird'),
      '4' => Category.new('Facts', fact_topics),
      '5' => Category.new('Words', word_topics),
    }[category]

    return 'Mastercard™️' unless category
    "#{category.name}: #{category.random_topic.message}"
  end

  def self.fact_topics
    [Topic.new(method(:get_cat_fact))]
  end

  def self.word_topics
    [Topic.new(method(:get_word_of_the_day))]
  end

  def self.get_cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    data = JSON.parse(response.body)
    data['fact']
  end

  def self.get_word_of_the_day
    response = HTTParty.get('https://www.merriam-webster.com/wotd/feed/rss2')
    feed = RSS::Parser.parse(response.body)
    word_of_the_day = Nokogiri::HTML(feed.items.first.description).text.split('Examples:').first.gsub(/\s+/, " ").strip
    word_of_the_day
  end
end
