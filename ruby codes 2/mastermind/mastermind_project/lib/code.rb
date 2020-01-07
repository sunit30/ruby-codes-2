class Code

   POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
    }

    attr_reader :pegs

  def self.valid_pegs?(array)
    array.all?{|peg|POSSIBLE_PEGS.has_key?(peg.upcase)}
  end

  def self.random(length)
    Code.new(Array.new(length){POSSIBLE_PEGS.keys.sample})
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

   def initialize(pegs)
   if !Code.valid_pegs?(pegs)
    raise "incorrect pegs"
   else
    @pegs=pegs.join("").upcase.split("")
   end
  end
  
  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def  num_exact_matches(pegs_instance)
    (0...pegs_instance.length).count { |i| pegs_instance[i] == @pegs[i] }
  end

  def num_near_matches(pegs_instance)
    num_matches = (0...pegs_instance.length).count do |i|
      guess_peg = pegs_instance[i]
      @pegs.include?(guess_peg)
    end

    num_matches - self.num_exact_matches(pegs_instance)
  end

  def ==(other_instance)
    self.pegs==other_instance.pegs
  end

end
