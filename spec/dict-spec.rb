require 'randomgrams/dict'

RSpec.describe "Dict" do

  let(:dict) { Dict.new("/usr/share/dict/words") }

  it "should have a word dictionary" do
    expect(dict.words).to be_a Hash
    expect(dict.found?("impossibleword")).to be false
    expect(dict.found?("test")).to be true
  end

  it "should allow words to be added to dictionary for testing" do
    dict.send :add, "testword"
    expect(dict.found?("testword")).to be true
    expect(dict.found?("impossibleword")).to be false
  end

  it "should take alternative dictionaries" do
    dict = Dict.new "/usr/share/dict/french"

    expect(dict.found?("chien")).to be true
  end

end
