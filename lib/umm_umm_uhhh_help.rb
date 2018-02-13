module UmmUmmUhhhHelp
  def self.run_example
    puts 'hi'
    7
  end
  def self.get_suggestion
    suggestions = [
      'Do you think space tourism will be big in the near future? Why or why not?',
      "Talk about how cute #{`whoami`.chomp} is"
    ]
    return suggestions.sample
  end
end
