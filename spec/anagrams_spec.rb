require "randomgrams/anagrams"
require "factorial"

RSpec.describe "Anagrams" do
  TESTWORD = "life"

  context "object methods" do
    it "should compute the permutations of word" do
      candidates = Anagrams.permute TESTWORD
      expect(candidates.length).to eq TESTWORD.length.fact
      expect(candidates).to include "file"
      expect(candidates).to include "lief"
    end

    it "should find any anagram in the dictionary" do
      candidate_anagrams = ["beach", "river", "pond"]
      anagrams = Anagrams.find_words candidate_anagrams
      expect(anagrams).to include "beach"
      expect(anagrams).to include "river"
    end

    it "should return a set of english anagrams for a word" do
      anagrams = Anagrams.new.for(TESTWORD)
      expect(anagrams).to include "file"
      expect(anagrams).to include "lief"
      expect(anagrams.length).to be 4
    end
  end

  context "class method" do
    it "should return a set of english anagrams for a word" do
      a = Anagrams.for(TESTWORD)
      expect(a).to include "file"
      expect(a).to include "lief"
      expect(a.length).to eq 4
    end
  end
end
