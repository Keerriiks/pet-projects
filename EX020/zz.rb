def doit
  zz = -> (msg = nil) { puts "zz: #{caller.reverse[1]}#{msg.nil? ? '' : ' => ' + msg}" }

  cond1 = [false,true].sample
  cond2 = [false,true].sample

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

doit
