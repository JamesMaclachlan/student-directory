def input_students
  puts "Please enter the names of the students and, on the following line, the months in which they enrolled. If you do not input a month of enrollment we will assume one. On the following lines please enter their: favourite hobby, height and city of birth."
  puts "To finish, just hit return twice."

  students = []

  name = gets.chomp.capitalize
  cohort = gets.chomp.capitalize
  while !name.empty? && cohort != "January" && cohort != "February" && cohort != "March" && cohort != "April" && cohort != "May" && cohort != "June" && cohort != "July" && cohort != "August" && cohort != "September" && cohort != "October" && cohort != "November" && cohort != "December"
    puts "Please retype the month spelt correctly."
    cohort = gets.chomp.capitalize
  end
  hobby = gets.chomp.capitalize
  height = gets.chomp.capitalize
  cob = gets.chomp.capitalize

  while !name.empty? do

    students << {name: name, cohort: cohort, hobby: hobby, height: height, cob: cob}
      if students.count == 1
        puts "Now we have #{students.count} student."
      else
        puts "Now we have #{students.count} students."
      end

    name = gets.chomp.capitalize
    break if name.empty?
    cohort = gets.chomp.capitalize
    while !name.empty? && cohort != "January" && cohort != "February" && cohort != "March" && cohort != "April" && cohort != "May" && cohort != "June" && cohort != "July" && cohort != "August" && cohort != "September" && cohort != "October" && cohort != "November" && cohort != "December"
      puts "Please retype the month spelt correctly."
      cohort = gets.chomp.capitalize
    end
    hobby = gets.chomp.capitalize
    height = gets.chomp.capitalize
    cob = gets.chomp.capitalize

  end
  students
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "Please choose from the following"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it to a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, please try again"
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print(students)
  students.select{|student| student[:name].start_with?('B') && student[:name].length < 12}.sort_by{|student| student[:cohort]}.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:hobby]}, #{student[:height]}, #{student[:cob]})".center(80)
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student.".center(80)
  elsif students.count == 0
    puts "There are currently #{students.count} students enrolled at Villains Academy".center(80)
  else
    puts "Overall, we have #{students.count} great students.".center(80)
  end
end

interactive_menu
if students.count > 0
  print_header
  print(students)
  print_footer(students)
end
