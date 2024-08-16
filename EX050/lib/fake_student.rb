class FakeStudent
  DEFAULT_FIRST_NAMES = ["Alice", "Bob", "Carl"]
  DEFAULT_LAST_NAMES = ["Roberts", "Smith", "Thompson"]

  attr_writer :age

  attr_writer :last_name

  def initialize(attrs={})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

  # Возраст студента.
  # @return [Integer | nil]
  def age
    @age.to_i if defined?(@age) && !@age.to_s[/^\d+$/].nil?
  end

  # Имя студента.
  # @return [String]
  def first_name
    return @first_name if defined? @first_name
    @first_name = DEFAULT_FIRST_NAMES.sample
  end

  # Фамилия студента.
  # @return [String]
  def last_name
    return @last_name.to_s if defined? @last_name
    @last_name = DEFAULT_LAST_NAMES.sample
  end

  # Форматированная информация о студенте.
  # @return [String]
  def personal_info
    return @personal_info if defined? @personal_info
    @personal_info = "#{first_name} #{last_name}#{age ? ', ' + age.to_s : ''}"
  end
end


