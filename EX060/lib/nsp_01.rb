module Nsp

  # @return [nil]
  def nsp(*args, &block)
    $is_end = false
    # @return [nil]
    def grep(*args)
      $is_end = true
      args = [__method__, args[0]]
      puts distributor(args, true)
    end

    # @return [nil]
    def count(*args)
      $is_end = true
      args = [__method__, args[0]]
      puts distributor(args, true)
    end

    puts distributor(args, true, &block) unless $is_end
  end

  # @return [nil]
  def nsp!(*args, &block)
    $is_end = false
    # @return [nil]
    def grep(*args)
      $is_end = true
      args = [__method__, args[0]]
      puts distributor(args, false)
    end

    # @return [nil]
    def count(*args)
      $is_end = true
      args = [__method__, args[0]]
      puts distributor(args, false)
    end

    # Распределитель.
    # @return [String]
    def distributor(args, include_super, &block)
      return self_help if args.size == 0

      if args[0] != :count
        methods_info(optional_object_methods(args, include_super, &block))
      else
        methods_count(optional_object_methods(args, include_super))
      end
    end

    puts distributor(args, false, &block) unless $is_end
  end

  private

  # Методы познания.
  # @return [Array]
  def cognition_methods
    self.methods.select { |m| m.to_s =~ /methods$/ }
  end

  # # Распределитель.
  # # @return [String]
  # def distributor(args, include_super, &block)
  #   return self_help if args.size == 0

  #   if args[0] != :count
  #     methods_info(optional_object_methods(args, include_super, &block))
  #   else
  #     methods_count(optional_object_methods(args, include_super))
  #   end
  # end

  # Информация о методах.
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

  # Кол-во найденных методов.
  # return [String]
  def methods_count(count)
    "\033[0;33;40mНайдено:\033\n\033[0;32;40m#{count}\033[0m\n"
  end

  # Все методы объекта-получателя.
  # @return [Hash]
  def object_methods(include_super)
    hash = {}
    cognition_methods.map { |m| hash.merge!({ m => self.public_send(mr).sort }) }
    hash
  end

  # Методы объекта-получателя, отобранные по шаблону.
  # @return [Hash]
  def optional_object_methods(args, include_super, &block)
      hash = {}
      sample = block_given? ? // : args[1]
      object_methods(include_super).each do |key, value|
          hash[key] = if sample.nil? && !block_given?
            "\033[0;31;40m#<ArgumentError: wrong number of arguments (given 1, expected 2)>\033[0m"
          else
            if block_given?
              value.select { |m| sample.match?(m.to_s) }.public_send("#{args[0]}", &block)
            else
              value.select { |m| sample.match?(m.to_s) }
            end
          end
      end
      return hash.values.map { |val| val.length }.sum if args[0] == :count
      hash
  end

  # Примеры использования.
  # @return [String]
  def self_help
  "\033[1;33;40mUSAGE: <obj>.nsp(<meth>, [...args])\033[0m

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