module Nsp

  # @return [nil]
  def nsp(*args, &block)
    def grep(*args)
      args = [__method__, args[0]]
      puts distributor(args, true)
    end

    def count(*args)
      args = [__method__, args[0]]
      puts distributor(args, true)
    end

    puts distributor(args, true, &block)
  end

  # @return [nil]
  def nsp!(*args, &block)
    def grep(*args)
      args = [__method__, args[0]]
      puts distributor(args, false)
    end

    def count(*args)
      args = [__method__, args[0]]
      puts distributor(args, false)
    end

    puts distributor(args, false, &block)
  end

  # # KV: NOTE: Тяжёлая эротика не для слабонервных №1.
  # # return [nil]
  # def nsp
  #   def grep(*args)
  #     args = [__method__, args[0]]
  #     puts distributor(args, true)
  #   end

  #   def count(*args)
  #     args = [__method__, args[0]]
  #     puts distributor(args, true)
  #   end

  #   puts self_help
  # end

  # # KV: NOTE: Тяжёлая эротика не для слабонервных №2.
  # # return [nil]
  # def nsp!
  #   puts self_help
  #   def grep(*args)
  #     args = [__method__, args[0]]
  #     puts distributor(args, false)
  #   end

  #   def count(*args)
  #     args = [__method__, args[0]]
  #     puts distributor(args, false)
  #   end

  #   puts self_help
  # end

  private

  # Методы познания.
  # @return [Array]
  def cognition_methods
    self.methods.select { |m| m.to_s =~ /methods$/ }
  end

  # Распределитель.
  # @return [String]
  def distributor(args, include_super, &block)
    return self_help if args.size == 0
    methods_info(optional_object_methods(args, include_super, &block))
  end

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

  # Все методы объекта-получателя.
  # @return [Hash]
  def object_methods(include_super)
    hash = {}
    cognition_methods.map { |m| hash.merge!({ m => self.public_send(m, include_super).sort }) }
    hash
  end

  # KV: TODO: По-хорошему надо разгрузить код — уменьшить условий, разбить на методы.
  # KV: TODO: Есть интерес стукнуться об это головой при тестировании.
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