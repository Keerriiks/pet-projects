class BakeZori
  class << self
    def bz(message "Мы тут!")
      $stdout << "BakeZori => { #{caller[0]} } <--- #{message}\n"
    end
  end
end


def doit

  bz # Показать место.
  bz "Hey!" # Показать место с сообщением.
  cond1 = Kernel.rand((Time.now.to_f * 1000).to_i).even?
  cond2 = Kernel.rand((Time.now.to_f * 1000).to_i).even?

  name = "Kirill"
  years_old = 21

  if cond1

    # Посмотреть место как признак.
    bz "<--- cond1 = #{cond1}"

  else
    name = name[0..-2]

    # Посмотреть содержимое одной переменной по факту.
    bz "<--- name = #{name.inspect}"


    if cond2
      years_old += 10
      # Посмотреть значения нескольких переменных по факту.
      bz "<--- name, years_old = #{name, years_old}"
    end
  end

  # УПР (упрощённый вариант): Посмотреть значения нескольких переменных по факту.
  bz name, years_old

  # NOTE: Варианты вызова с `!` будут не только печатать отладочную информацию, но и возвращать то, что в него передали при вызове.
  # Посмотреть значения нескольких переменных по факту и вернуть их v1.
  name, years_old = bz! name + "l", years_old - 10

  # Посмотреть значения нескольких переменных по факту и вернуть определенные v2.
  name, cond2 = bz! "name!, years_old, cond1, cond2! #{name.reverse, years_old, cond1, cond2}"
end

