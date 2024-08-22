
class A
def doit
  zz = -> (msg = nil) { puts "zz => #{caller.reverse[0]}##{__method__}#{msg.nil? ? '' : '::' + msg}" }

  cond1 = Kernel.rand(0..1).even?
  cond2 = Kernel.rand(0..1).even?

  zz.call("Привет, мы в doit!")
  if cond1
    zz.("if cond1 = true")
  else
    zz.("if cond1 = false")
    if cond2
      zz.("if cond2 = true")
    end
    zz.()
  end
  zz.("Пока из `doit`!")
end
end
A.new.doit
