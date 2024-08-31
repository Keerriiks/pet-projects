module Nsp

  # @return [nil]
  def nsp(meth=nil, args=[])
    #self_help if meth.nil? && args.empty?

    puts info
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
  def info
    index = 1
    str = ""
    object_methods.each do |key, value|
      str += "\033[0;33;40m#{index}. #{key}\033\n"
      str += "\033[0;32;40m#{value}\033\n\n"
      index += 1
    end
    str
  end

  # @return [Hash]
  def object_methods(value=nil)
    hash = {}
    cognition_methods.map { |m| hash.merge!({ m => self.public_send(m).sort })}
    hash
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