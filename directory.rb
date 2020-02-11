@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # get the first name
  name = gets.chomp.capitalize
  # while the name is empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    @students << {name: name, cohort: :November}
    puts "Now we have #{@students.count} students."
    # get another name from the user
    name = gets.chomp.capitalize
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "Please choose from the following:"
  puts "1. Input the students."
  puts "2. Show the students."
  puts "9. Exit." # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student.
    "
  else
    puts "Overall, we have #{@students.count} great students.
    "
  end
end

interactive_menu
