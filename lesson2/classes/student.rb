require_relative "base_tool"

class Student < BaseTool
  AttrMagic.load(self)

  # @return [String]
  attr_accessor :email

  # @return [File]
  attr_accessor :file

  attr_writer :faculty

  # @return [String]
  attr_accessor :first_name

  # @return [String]
  attr_accessor :last_name

  attr_writer :middle_name

  def initialize(attrs = {})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

  # @return [String]
  def student_card
    require_attr :email

    card = ""
    card << "\nname    : #{full_name}\n"
    card << "e-mail  : #{email}\n"
    card << "faculty : #{faculty}\n" unless faculty.empty?
    card
  end

  #--------------------------------------- Lazy-атрибуты

  public

  # @return [String]
  def full_name
    require_attr :first_name
    require_attr :last_name

    name = ""
    name << first_name + " " 
    name << prepared_middle_name + " " unless middle_name.empty?
    name << last_name
    name
  end

  private

  # @return [String] optional
  def faculty
    return @faculty if defined? @faculty
    @faculty = ""
  end

  # @return [String] optional
  def middle_name
    return @middle_name if defined? @middle_name
    @middle_name = ""
  end

  # @return [String]
  def prepared_middle_name
    middle_name[0] + "."
  end
end