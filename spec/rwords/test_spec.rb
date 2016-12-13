require_relative '../../lib/rwords/main'

describe Main do
  it "prints 101" do
    expect(Main::BOB).to eq 101
  end

  it "says 'Hello'" do
    rw = Main::Rwords.new
    res = rw.test
    expect(res).to eq "Hello"
  end
end

#x = Main::Rwords.new
#puts x.test
