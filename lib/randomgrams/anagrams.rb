require 'randomgrams/dict'
DEFAULT_DICT = "/usr/share/dict/words"

class Anagrams
  attr_reader :dict

  def initialize(dict=DEFAULT_DICT)
    @dict = Dict.new(dict)
  end

  def for(word)
    find_words(all_permutations(word))
  end

  private

  def permutation(word, k=word.length)
    word.chars.permutation(k).map(&:join)
  end

  def all_permutations(word)
    n = word.length

    (1..n).each.collect { |k| word.chars.permutation(k).map(&:join) }.flatten
  end

  def find_words(anagrams)
    anagrams.select { |a| @dict.found? a }
  end

end
