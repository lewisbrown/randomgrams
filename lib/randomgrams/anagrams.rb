require 'randomgrams/dict'

class Anagrams
  @dict = Dict.new("/usr/share/dict/words")

  def self.for(word)
    find_words(permute(word))
  end

  def for(word)
    Anagrams.find_words(Anagrams.permute(word))
  end

  private

  def self.permute(word)
    w = word.split(//)
    w.permutation.collect{ |letters| letters.join }.uniq
  end

  def self.find_words(anagrams)
    @words = []
    anagrams.each do |anagram|
      @words << anagram if @dict.lookup anagram
    end
    @words
  end

end
