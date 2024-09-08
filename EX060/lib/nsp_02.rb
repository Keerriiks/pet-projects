module NspEntrance

  def nsp
    Nsp
  end

end


class Nsp
  class << self
    def grep
      puts "СРАБОТАЛ GREP"
    end
  end
end

=begin

nsp это класс

nsp.grep //

nsp :grep, //

=end
