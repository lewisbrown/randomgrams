require "randomgrams/anagrams"
require "factorial"

RSpec.describe "Anagrams" do
  TESTWORD = "life"

  let(:a) { Anagrams.new }

  context "permutation object methods" do
    it "should compute the permutations of word" do
      candidates = a.send :permutation, TESTWORD, TESTWORD.length

      expect(candidates.length).to eq TESTWORD.length.fact
      expect(candidates).to include "file"
      expect(candidates).to include "lief"
    end

    it "should compute the 3-permutations of word" do
      candidates = a.send :permutation, TESTWORD, 3

      expect(candidates.length).to eq (TESTWORD.length.fact / (TESTWORD.length - 3).fact)
      expect(candidates).to include "ile"
      expect(candidates).to include "ief"
    end
  end

  context "permutations" do
    it "should calculate all permutations of the word" do
      permutations = a.send :all_permutations, TESTWORD

      expect(permutations.length).to eq 64
      expect(permutations).to include "file"
      expect(permutations).to include "elf"
      expect(permutations).to include "fl"
    end
  end

  context "find_words" do
    it "should find any anagram in the dictionary" do
      candidate_anagrams = ["beach", "river", "fqz"]
      anagrams = a.send :find_words, candidate_anagrams

      expect(anagrams.length).to eq 2
      expect(anagrams).to include "beach"
      expect(anagrams).to include "river"
      expect(anagrams).not_to include "fqz"
    end

    it "should return a set of english anagrams for a word" do
      anagrams = a.for(TESTWORD)

      expect(anagrams).to include "file"
      expect(anagrams).to include "lief"
      expect(anagrams).to include "elf"
      expect(anagrams).to include "lie"
      expect(anagrams).to include "i"
      expect(anagrams).not_to include "impossibleword"
    end
  end
end
