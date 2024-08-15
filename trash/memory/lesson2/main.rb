#!/usr/bin/env ruby

require_relative "classes/student"
require_relative "classes/student_cards_maker"

if false
  student_card1 = Student.new({
    first_name: "Kirill",
    middle_name: "Borisovich",
    last_name: "Vikulin",

    email: "raskolbas@cheese.com",
    faculty: "Fizmat",
  }).student_card


  student_card3 = Student.new(first_name: "Kirill", last_name: "Vikulin", \
                            email: "raskolbas@cheese.com").student_card

  puts student_card1
  puts student_card2
  puts student_card3
end

student_cards = StudentCardsMaker.new(file_name: "/home/kir/pet-projects/lesson2/students_data/students2024.txt").student_cards
puts student_cards
