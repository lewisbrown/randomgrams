class Anagrams

  attr_accessor :anagrams
  attr_accessor :dict
  attr_reader   :words

  def self.for(word)
    @dict    = Dict.new("/usr/share/dict/words")
    find_words(permute(word))
  end

  def initialize
    @dict    = Dict.new("/usr/share/dict/words")
  end

  def for(word)
    find_words(permute(word))
  end

  private

  def permute(word)
    word.permutation.collect{ |letters| letters.join }.uniq
  end

  def find_words(anagrams)
    anagrams.each do |anagram|
      words << anagram if dict.lookup anagram
    end
    anagrams
  end

end
