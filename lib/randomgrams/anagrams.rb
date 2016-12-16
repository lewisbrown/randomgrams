require 'randomgrams/dict'

class Anagrams
  @dict = Dict.new("/usr/share/dict/words")

  def self.for(word)
    find_words(permutations_of_combinations(combinations(word)))
  end

  def for(word)
    Anagrams.find_words(Anagrams.permutations_of_combinations(Anagrams.combinations(word)))
  end

  private

  def self.permutation(word)
    w = word.split('')
    w.permutation.map { |letters| letters.join } #.uniq
  end

  def self.combination(word, k_choices)
    w = word.split('')
    w.combination(k_choices).map { |letters| letters.join } #.uniq
  end

  def self.combinations(word)
    n = word.length
    combinations = []

    (1..n).each do |k|
      combinations << Anagrams.combination(word, k)
    end

    combinations.flatten
  end

  def self.permutations_of_combinations(combinations)
    permutations = []

    combinations.each do |c|
      permutations << Anagrams.permutation(c) #.uniq
    end

    permutations.flatten
  end

  def self.find_words(anagrams)
    @words = []
    anagrams.each do |anagram|
      @words << anagram if @dict.lookup anagram
    end
    @words
  end

end
