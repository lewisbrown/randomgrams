require "randomgrams/anagrams"
require "factorial"

RSpec.describe "Anagrams" do
  TESTWORD = "life"

  context "permutation object methods" do
    it "should compute the permutations of word" do
      candidates = Anagrams.permutation TESTWORD
      expect(candidates.length).to eq TESTWORD.length.fact
      expect(candidates).to include "file"
      expect(candidates).to include "lief"
    end
  end

  context "combinations" do
    it "should compute the combinations of word" do
      expect(Anagrams.combination("life",4).length).to eq 1
      expect(Anagrams.combination("life",3).length).to eq 4
      expect(Anagrams.combination("life",2).length).to eq 6
      expect(Anagrams.combination("life",1).length).to eq 4
    end

    it "should compute all combinations" do
      combinations = Anagrams.combinations("life") 
      expect(combinations.length).to eq 15
      expect(combinations).to include "life"
      expect(combinations).to include "lfe"
      expect(combinations).to include "i"
      expect(combinations).to include "l"
    end
  end

  context "permutaions of combinations" do
    it "should calculate the permutations of each combination" do
      combinations = Anagrams.combinations("life")
      permutations = Anagrams.permutations_of_combinations(combinations)
      expect(permutations.length).to eq 64
      expect(permutations).to include "file"
      expect(permutations).to include "elf"
      expect(permutations).to include "fl"
    end
  end

  context "find_words" do
    it "should find any anagram in the dictionary" do
      candidate_anagrams = ["beach", "river", "pond"]
      anagrams = Anagrams.find_words candidate_anagrams
      expect(anagrams).to include "beach"
      expect(anagrams).to include "river"
      expect(anagrams).not_to include "fe"
    end

    it "should return a set of english anagrams for a word" do
      anagrams = Anagrams.new.for(TESTWORD)
      expect(anagrams).to include "file"
      expect(anagrams).to include "lief"
      expect(anagrams).to include "elf"
      expect(anagrams).to include "lie"
      expect(anagrams).to include "i"
      expect(anagrams).not_to include "impossibleword"
    end
  end

  context "permutation class method" do
    it "should return a set of english anagrams for a word" do
      a = Anagrams.for(TESTWORD)

      expect(a).to include "file"
      expect(a).to include "lief"
      expect(a).to include "elf"
      expect(a).to include "lie"
      expect(a).to include "i"
      expect(a).not_to include "ife"
    end
  end
end
