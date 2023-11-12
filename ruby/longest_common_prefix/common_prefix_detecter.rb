class CommonPrefixDetecter
  def initialize(strings)
    @strings = strings
    @prefix_store = {}
    store_prefixes
  end

  def common_prefix
    return '' unless common_prefixes?

    @prefix_store.select { |_, v| v == @strings.length }.to_a.last.first
  end

  def store_prefixes
    @strings.each { |word| word_prefix_to_store(word) }
  end

  def common_prefixes?
    !@prefix_store.key(@strings.length).nil?
  end

  def word_prefix_to_store(word)
    word.length.times do |n|
      if @prefix_store[word[0..n]]
        @prefix_store[word[0..n]] += 1
      else
        @prefix_store[word[0..n]] = 1
      end
    end
  end
end
