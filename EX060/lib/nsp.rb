module Nsp

  # @return [nil]
  def nsp(*args)
    return self_help if args.size == 0

    puts methods_info(optional_object_methods(args[0], args[1]))
  end

  # @return [nil]
  def nsp!(*args)
    return self_help if args.size == 0

    puts methods_info(optional_object_methods(args[0], args[1], false))
  end

  private

  # @return [Array]
  def cognition_methods
    self.methods.select { |m| m.to_s =~ /methods$/ }
  end

  # @return [String]
  def methods_info(methods)
    index = 1
    str = ""
    methods.each do |key, value|
      str += "\033[0;33;40m#{index}. #{key}\033\n"
      str += "\033[0;32;40m#{value}\033\033[0m\n\n"
      index += 1
    end
    str[-1] = ""
    str
  end

  # @return [Hash]
  def object_methods(include_super)
    hash = {}
    cognition_methods.map { |m| hash.merge!({ m => self.public_send(m, include_super).sort }) }
    hash
  end

  # @return [Hash]
  def optional_object_methods(meth, args, include_super = true)
    if meth == :grep
      hash = {}
      object_methods(include_super).each do |key, value|
        hash[key] = !args.nil? ? value.select { |m| args.match?(m.to_s) } : "\033[0;31;40m#<ArgumentError: wrong number of arguments (given 1, expected 2)>\033"
      end
      hash
    end
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