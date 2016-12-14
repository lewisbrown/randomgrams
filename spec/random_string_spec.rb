require 'rspec'
require 'random_string'

RSpec.describe "RandomString" do
  N = 5
  
  let(:str) { RandomString.generate(N) }

  it "should be a string of specified length" do
    expect(str.length).to eq N
  end

  it "should generate only lowercase letters" do
    expect(str.length).to eq N
    expect(str).to match(/[a-z]+/)
  end

  it "should produce random strings" do
    str2 = RandomString.generate(N)

    expect(str2).not_to eql str
  end
end
