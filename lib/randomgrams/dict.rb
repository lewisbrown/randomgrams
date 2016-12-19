class Dict
  DEFUALT_DICT = '/usr/share/dict/words'

  attr_accessor :words

  def initialize(file=DEFUALT_DICT)
    @words = Hash.new(false)
    File.readlines(file).map(&:chomp).each do |word|
      words[word.downcase] = true
    end
  end

  def found?(word)
    words[word]
  end

  private

  def add(word)
    words[word] = true
  end
end
