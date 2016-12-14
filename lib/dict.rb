module Main
  class Dict
    attr_accessor :words

    def initialize(file)
      @words = Hash.new(false)
      File.readlines(file).map(&:chomp).each do |word|
        words[word.downcase] = true if word[-2] != '?'
      end
    end

    def lookup(word)
      words[word]
    end

    def add(word)
      words[word] = true
    end
  end
end
