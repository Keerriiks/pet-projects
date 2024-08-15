class BakeZori
  class << self
    def bz(message "Мы тут!")
      $stdout << "BakeZori => { #{caller[0]} } <--- #{message}\n"
    end
  end
end

def doit
  BakeZori.bz("Привет, мы тут!")
  if false
    BakeZori.bz("Исполнение пришло в ветку `if cond1 = #{"cond1"}`.")
  else
    BakeZori.bz("Исполнение пришло в ветку `if cond1 = #{"cond1"}`.")
    if true
      BakeZori.bz("Исполнение пришло в ветку `if cond2 = #{"cond2"}`.")
    end
  end
  BakeZori.bz("Пока из `doit`!")
end

doit
BakeZori.bz

pp