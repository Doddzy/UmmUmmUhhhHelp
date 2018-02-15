class Topic
  def initialize(suggestion)
    @suggestion = suggestion
  end

  def message
    return @suggestion.call if @suggestion.respond_to? :call

    @suggestion
  end
end
