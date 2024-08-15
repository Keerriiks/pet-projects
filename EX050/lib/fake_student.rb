class FakeStudent
  ALLOWED_FIRST_NAMES = ["Alice", "Bob", "Carl"]
  DEFAULT_LAST_NAMES = ["Roberts", "Smith", "Thompson"]

  # NOTE: Возраст студента.
  # @return [Integer | nil]
  attr_accessor :age

  attr_writer :last_name

  # @return [Hash]
  def initialize(attrs={})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

  # NOTE: Имя студента.
  # @return [String]
  def first_name
    return @first_name if defined? @first_name
    @first_name = ALLOWED_FIRST_NAMES.sample
  end

  # NOTE: Фамилия студента.
  # @return [String]
  def last_name
    return @last_name if defined? @last_name
    @last_name = DEFAULT_LAST_NAMES.sample
  end

  # NOTE: Форматированная информация о студенте.
  # @return [String]
  def personal_info
    return @personal_info if defined? @personal_info
    @personal_info = "#{first_name} #{last_name}#{age.nil? ? '' : 'age , ' + age.to_s}"
  end
end


