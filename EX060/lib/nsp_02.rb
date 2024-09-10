module Nsp
  def nsp(method=nil, *args, &block)
    if method == :grep
      puts "nsp :grep"
      return nil
    end
    self
  end

  def grep(*args)
    puts "nsp.grep"
  end
end

class Object
  include Nsp
end