module Nsp

  # @return [nil]
  def nsp(args={})

    # ...

    help
  end

  # @return [nil]
  def nsp!(args={})

    # ...

    help
  end

  private

  # @return [String]
  def help
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