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
    sorted_students.each do |place, student|  
      puts "\e[1;35m●●●\e[0m student #{student.inspect}"
      cards << Student.new(student).student_card
    end
    cards
  end

  #--------------------------------------- Lazy-атрибуты
  public
  
  # @return [Hash]
  def students
    students_data = {}
    place = 0
    read_student_data_from_file.each do |line|
      place += 1
      student_data = line
      students_data[place] = { 
        "email": student_data[3],
        "faculty": student_data[4],
        "first_name": student_data[1],
        "last_name": student_data[0],
        "middle_name": student_data[2],
      } unless student_data[0].nil? || student_data[0].empty? || student_data[1].nil? || student_data[1].empty? || student_data[3].nil? || student_data[3].empty?
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
    students.sort_by { |place, student| sorting_order.map { |key| student[:key] } }.to_h
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