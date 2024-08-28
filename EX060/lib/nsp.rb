module Nsp

  # @return [nil]
  def nsp(meth=nil, args=[])
    #self_help if meth.nil? && args.empty?

    puts cognition_methods.inspect

  end

  # @return [nil]
  def nsp!(meth, args=[])

    # ...

    nsp(meth, args)
  end

  private

  # @return [Array]
  def cognition_methods
    self.methods.select { |m| m.to_s =~ /methods$/ }
  end

  # @return [String]
  def trace_of_method(value)

  end

  # @return [String]
  def self_help
    puts "\033[1;33;40mUSAGE: <obj>.nsp(<meth>, [...args])\033[0m

\033[1;33;40mEXAMPLES:\033[0m

* Class.nsp :grep, /inst/
* \"\".nsp! :grep, //
* {}.nsp! :grep, //
    "
  end
end

class Object
  include Nsp
end