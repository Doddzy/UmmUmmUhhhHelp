require 'httparty'

module UmmUmmUhhhHelp
  def self.get_suggestion
    suggestion = [
      'Do you think space tourism will be big in the near future? Why or why not?',
      "Talk about how cute #{`whoami`.chomp} is",
      method(:get_cat_fact)
    ].sample

    return suggestion.call if suggestion.is_a?(Method)
    suggestion
  end

  def self.get_cat_fact
    response = HTTParty.get('https://catfact.ninja/fact')
    data = JSON.parse(response.body)
    data['fact']
  end
end
