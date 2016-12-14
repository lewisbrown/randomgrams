require "randomgrams/anagrams"
require "factorial"

class Integer
  include Factorial
end

RSpec.describe "Anagrams" do
  TESTWORD = "life" 

  context "object methods" do
    let(:a) { Anagrams.new }

    it "should compute the permutations of word" do
      candidates = Anagrams.permute TESTWORD
      #candidates = Anagrams.send :permute, TESTWORD
      expect(candidates.length).to eq TESTWORD.length.fact
      expect(candidates).to include "file"
      expect(candidates).to include "lief"
    end

    it "should find any anagram in the dictionary" do
      candidates = Anagrams.permute TESTWORD
      anagrams = Anagrams.find_words candidates
      expect(anagrams).to include "file"
      expect(anagrams).to include "lief"
      expect(anagrams.length).to be 4
    end

    it "should return a set of english anagrams for a word" do
      anagrams = a.for(TESTWORD)
      expect(anagrams).to include "file"
      expect(anagrams).to include "lief"
      expect(anagrams.length).to be 4
    end
  end

  context "class methods" do
    it "should return a set of english anagrams for a word" do
      a = Anagrams.for(TESTWORD)
      expect(a).to include "file"
      expect(a).to include "lief"
      expect(a.length).to eq 4
    end
  end
end
