require 'randomgrams/factorial'

RSpec.describe "Factorial" do

  class Integer
    include Factorial
  end

  it "should give the factorial" do
    expect(1.fact).to eq 1
    expect(3.fact).to eq 6
    expect(4.fact).to eq 24
  end
end
