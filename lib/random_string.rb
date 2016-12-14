class RandomString
  def self.generate(length)
    random_string = ""
    a_ord = "a".ord
    z_ord = "z".ord

    length.times do
      random_string << rand(a_ord .. z_ord).chr
    end

    random_string
  end
end
