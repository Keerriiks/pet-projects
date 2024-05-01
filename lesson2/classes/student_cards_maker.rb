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
    sorted_students.each { |student| cards << student.student_card }
    cards
  end

  #--------------------------------------- Lazy-атрибуты
  public
  
  # @return [Array]
  def students
    students_data = []
    read_student_data_from_file.each do |line|
      student_data = line
      students_data << { 
        "email": student_data[3],
        "faculty": student_data[4],
        "first_name": student_data[1],
        "last_name": student_data[0],
        "middle_name": student_data[2],
      } unless student_data[0].nil? || student_data[0].empty? || student_data[1].nil? || student_data[1].empty? || student_data[3].nil? || student_data[3].empty?
    end

    _students = []
    students_data.each do |student|  
      _students << Student.new(student)
    end
    _students
  end

  private

  # @return [Array]
  def sorting_order
    return @sorting_order if defined? @sorting_order
    @sorting_order = ["last_name", "first_name"] 
  end

  # @return [Hash]
  def sorted_students
    students.sort_by { |student|  sorting_order.map { |key| student.public_send(key) }  }
  end

  # @return [Array]
  def read_student_data_from_file
    lines = []
    file = File.new(file_name, "r:UTF-8")
    file.each_line { |line| lines << line.split('|').map { |i| i.strip } }
    file.close
    lines 
  end
end