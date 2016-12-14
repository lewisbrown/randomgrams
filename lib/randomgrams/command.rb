require 'randomgrams'

module Randomgrams

  class Command
    def initialize(args)
      @args = args
    end

    def run
      usage unless @args.length == 1

      n = @args[0].to_i

      s = RandomString.generate(n)
      puts "your string was: " + s

      a = Anagrams::for(s)
      puts "your anagrams are: " + a.join(", ")
    end

    def usage
      puts "Usage: randomgrams <number>"
      exit
    end
  end
end
