=begin

nsp # => подсказка

nsp :grep, // # => всё норм
nsp :grep     # => ожидалось 2 аргумента

nsp(:map) { |s| s.to_s.reverse } # можно передать блок

nsp.grep //  # => всё норм


=end




