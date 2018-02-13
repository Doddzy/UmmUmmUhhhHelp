require 'httparty'

module UmmUmmUhhhHelp
  def self.run_example
    puts 'hi'
    7
  end
  def self.get_suggestion
    suggestions = [
      'Do you think space tourism will be big in the near future? Why or why not?',
      "Talk about how cute #{`whoami`.chomp} is",
      method(:get_cat_fact)
    ]
    suggestion = suggestions.sample
    if suggestion.is_a?(Method)
      suggestion = suggestion.call
    end
    return suggestion
  end
  def self.get_cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    data = JSON.parse(response.body)
    data['fact']
  end
end
