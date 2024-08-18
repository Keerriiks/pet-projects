class FakeStudent
  DEFAULT_FIRST_NAMES = ["Alice", "Bob", "Carl"]
  DEFAULT_LAST_NAMES = ["Roberts", "Smith", "Thompson"]

  # Возраст студента.
  # @return [Integer | nil]
  attr_accessor :age

  attr_writer :last_name

  def initialize(attrs={})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

  # Имя студента.
  # @return [String]
  def first_name
    @first_name ||= DEFAULT_FIRST_NAMES.sample
  end

  # Фамилия студента.
  # @return [String]
  def last_name
    @last_name ||= DEFAULT_LAST_NAMES.sample
  end

  # Форматированная информация о студенте.
  # @return [String]
  def personal_info
    @personal_info ||= "#{first_name} #{last_name}#{age ? ', ' + age.to_s : ''}"
  end
end


