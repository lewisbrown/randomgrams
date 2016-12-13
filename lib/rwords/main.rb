module Main

  class Dict
    attr_accessor :words

    def initialize(file)
      @words = Hash.new(false)
      File.readlines(file).map(&:chomp).each do |word|
        words[word.downcase] = true if word[-2] != ?' 
      end
    end

    def lookup(word)
      words[word]
    end

    def add(word)
      words[word] = true
    end
  end

  # Randomgrams
  class Rwords

    attr_reader   :length
    attr_accessor :random_chars
    attr_accessor :anagrams
    attr_accessor :dict
    attr_reader   :words

    def initialize(length)
      @length   = length
      @random_chars = []
      @anagrams = []
      @dict    = Dict.new("/usr/share/dict/words")
      @words   = []
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
