class BracketValidator
  BRACKET_MAP = {
    '}' => '{',
    ')' => '(',
    ']' => '['
  }.freeze

  def initialize(str)
    @string = str
  end

  def valid?
    cache = []
    @string.length.times do |b|
      cache << @string[b] if BRACKET_MAP.values.include?(@string[b])
      return false if BRACKET_MAP.keys.include?(@string[b]) && cache.last != BRACKET_MAP[@string[b]]
      return false if BRACKET_MAP.keys.include?(@string[b]) && cache.empty?

      cache.pop if cache.last == BRACKET_MAP[@string[b]]
    end
    cache.empty?
  end
end
