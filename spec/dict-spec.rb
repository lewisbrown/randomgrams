require 'randomgrams/dict'

RSpec.describe "Dict" do

  let(:dict) { Dict.new("/usr/share/dict/words") }

  it "should have a word dictionary" do
    expect(dict.words).to be_a Hash
    expect(dict.lookup("impossibleword")).to be false
    expect(dict.lookup("test")).to be true
  end

  it "should allow words to be added to dictionary" do
    dict.add("testword")
    expect(dict.lookup("testword")).to be true
    expect(dict.lookup("impossibleword")).to be false
  end

end
