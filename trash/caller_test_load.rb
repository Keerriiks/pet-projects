def d count
  count -= 1
  puts "caller: из метода `d`: #{caller}"
  return d count if count != 0
end