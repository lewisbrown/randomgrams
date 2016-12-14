srand 1234

require 'factorial'
require 'randomgrams'
require 'dict'
require 'random_string'

class Integer
  include Factorial
end

module Main

  # create random string of chars
  RSpec.describe "Randomgrams" do

    RANDOM_STRING = 'life'
    N = RANDOM_STRING.length
    N_FACT = N.fact

    let(:rw) { Randomgrams.new(N) }

    it "should be initialized by a number" do
      expect(rw.length).to eq N
    end

    it "should generate random letters" do
      rw.generate
      expect(rw.random_chars.length).to eq N
      expect(rw.random_chars.join).to match(/[a-z]+/)
    end

    it "should compute permutations" do
      rw.random_chars = RANDOM_STRING.split(//)
      rw.permute
      #expect(rw.anagrams[0]).to eq RANDOM_STRING
      expect(rw.anagrams.length).to eq N_FACT
    end

    it "should have a word dictionary" do
      expect(rw.dict.words).to be_a Hash
      expect(rw.dict.lookup("impossibleword")).to be false
      expect(rw.dict.lookup(RANDOM_STRING)).to be true
    end

    it "should allow words to be added to dictionary" do
      rw.dict.add(RANDOM_STRING)
      expect(rw.dict.lookup(RANDOM_STRING)).to be true
      expect(rw.dict.lookup("impossibleword")).to be false
    end

    it "should find any anagram in the dictionary" do
      rw.generate
      rw.permute
      rw.anagrams.map { |w| rw.dict.add(w) }
      expect(rw.dict.lookup(rw.anagrams[0])).to be true
      expect(rw.dict.lookup(rw.anagrams[N_FACT-1])).to be true
      expect(rw.dict.lookup("impossibleword")).to be false
    end

    it "should produce an array of anagrams found in the dictionary" do
      rw.random_chars = RANDOM_STRING.split(//)
      rw.permute
      rw.find_words
      expect(rw.words.length).to eq 4
      puts rw.words
      #bindings.pry
    end

  end

  RSpec.describe "Dict" do
    let(:d) { Dict.new("/usr/share/dict/words") }

    it "should have a hash of words" do
      expect(d.words).to be_a_kind_of Hash
      expect(d.words["apple"]).to_not be_nil 
    end

    it "should allow lookup of words" do
      expect(d.lookup("apple")).to be true
    end

    it "should allow addition of new words" do
      expect(d.add("impossibleword")).to be true
      expect(d.lookup("impossibleword")).to be true
    end
  end
end
