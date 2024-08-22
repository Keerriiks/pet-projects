def hello
  puts "Hello, peeple!"
end

hello

# 1) Метод `hello` принадлежит классу `Object`.
method(:hello).owner

# 2) Метод `hello` является приватным.
Object.private_method_defined?(:hello)
Object.new.private_methods.include?(:hello)

# 3) Метод `hello` является “instance-методом”.
Object.private_instance_methods.include?(:hello)

# 4.1) Сделаем неявный вызов.
hello

# 4.2) Сделаем явный вызов.
self.hello

# 4.3) Сделаем неявный вызов через `send`.
send(:hello)

# 4.4) Вызовем от экземпляра.
Object.new.send(:hello)

# 4.5) Сделаем метод `hello` публичным.

class Object
  public
  def hello
    puts "Hello, peeple!"
  end
end

Object.new.hello

# 4.6) Сделаем метод `hello` публичным.

class Object
  def hello
    puts "Hello, peeple!"
  end
end

Object.new.hello

# 4.7) Сделаем `hello` публичным и вызовем от класса.

class Object
  def hello
    puts "Hello, peeple!"
  end
end

Object.hello

# 4.8) Сделаем вызов `hello` через публичный метод `public_hello`.

class Object
  def public_hello
    hello
  end
end

Object.new.hello
