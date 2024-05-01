require_relative "base_tool"

class StudentCardsMaker < BaseTool
  AttrMagic.load(self)

  require_relative "student"

  attr_writer :sorting_order

  # @return [String]
  attr_accessor :file_name

  def initialize(attrs = {})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

  # @return [String]
  def student_cards
    cards = ""
    sorted_students.each do |data|  
      student_card = Student.new(last_name: data[0], first_name: data[1], middle_name: data[2], email: data[3], faculty: data[4]).student_card
      cards << student_card
    end
    cards
  end

  #--------------------------------------- Lazy-атрибуты
  public
  
  # @return [Hash]
  def students
    students_data = {}
    read_student_data_from_file.each do |line|
      student_data = line.split('|')
      students_data << { 
        "email": student_data[3],
        "faculty": student_data[4],
        "first_name": student_data[1],
        "last_name": student_data[0],
        "middle_name": student_data[2],
      } unless student_data.any? { |s| s.empty? } || student_data[0].empty? || student_data[1].empty? || student_data[3].empty?
    end
    students_data
  end

  private

  # @return [Array]
  def sorting_order
    return @sorting_order if defined? @sorting_order
    @sorting_order = ["last_name", "first_name"] 
  end

  # @return [Hash]
  def sorted_students
    students.sort_by { |student| sorting_order.map { |key| student[key] } }
  end

  # @return [Array]
  def read_student_data_from_file
    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close
    lines
  end
end