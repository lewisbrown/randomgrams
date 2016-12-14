module Randomgrams

  class Main
    attr_reader   :length
    attr_accessor :random_chars
    attr_accessor :anagrams
    attr_accessor :dict
    attr_reader   :words

    def initialize(length)
      @length   = length
      @random_chars = []
      @anagrams = []
      @words   = []
      @dict    = Dict.new("/usr/share/dict/words")
    end

    def generate()
      a_ord = "a".ord
      z_ord = "z".ord

      length.times do
        random_chars << rand(a_ord .. z_ord).chr
      end
    end

    def permute()
      @anagrams = random_chars.permutation.collect{ |letters| letters.join }.uniq
    end

    def find_words()
      anagrams.each do |anagram|
        words << anagram if dict.lookup anagram
      end
    end
  end
end
