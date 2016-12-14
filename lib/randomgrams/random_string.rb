class RandomString
  def self.generate(length)
    random_string = ""

    length.times do
      random_string << rand(?a.ord .. ?z.ord).chr
    end

    random_string
  end
end
