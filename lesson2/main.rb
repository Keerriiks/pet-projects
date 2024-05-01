require_relative "classes/student"
require_relative "classes/student_cards_maker"


# student_card1 = Student.new(first_name: "Kirill", last_name: "Vikulin", \
#                            middle_name: "Borisovich", faculty: "Fizmat", \
#                            email: "raskolbas@cheese.com").student_card


# student_card3 = Student.new(first_name: "Kirill", last_name: "Vikulin", \
#                            email: "raskolbas@cheese.com").student_card


# puts student_card1
# # puts student_card2
# puts student_card3


student_cards = StudentCardsMaker.new(file_name: "/home/kir/pet-projects/lesson2/students_data/students2024.txt").student_cards
puts student_cards