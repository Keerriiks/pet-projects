require_relative "classes/student"

student_card1 = Student.new(first_name: "Kirill", last_name: "Vikulin", \
                           middle_name: "Borisovich", faculty: "Fizmat", \
                           email: "raskolbas@cheese.com").student_card

# student_card2 = Student.new(last_name: "Vikulin", \
#                             middle_name: "Borisovich", faculty: "Fizmat", \
#                             email: "raskolbas@cheese.com").student_card

student_card3 = Student.new(first_name: "Kirill", last_name: "Vikulin", \
                           email: "raskolbas@cheese.com").student_card


puts student_card1
# puts student_card2
puts student_card3