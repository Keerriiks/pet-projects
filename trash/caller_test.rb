require_relative "caller_test_load"


ar = 100

puts "caller:The Top Level Context: #{Kernel.caller}"

def a
  puts "caller: из метода `a`: #{caller}"
end

def b
  puts "caller: из метода `b`: #{caller}"
  a
end

def f
  puts "caller: из метода `f`: #{caller}"
  def c
    puts "caller: из метода `f::c`: #{caller}"
    b
  end
  c
end

a
b
# f::c
# f
# d 3



