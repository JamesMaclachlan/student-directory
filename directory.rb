def input_students
  puts "Please enter the names of the students and, on the following line, the months in which they enrolled. If you do not input a month of enrollment we will assume one. On the following lines please enter their: favourite hobby, height and city of birth."
  puts "To finish, just hit return twice."

  students = []

  name = gets.chomp.capitalize
  cohort = gets.chomp.capitalize
  if cohort.empty?
    cohort = "November"
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
    if cohort.empty?
      cohort = "November"
    end
    hobby = gets.chomp.capitalize
    height = gets.chomp.capitalize
    cob = gets.chomp.capitalize

  end
  students
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
    puts "Overall, we have #{students.count} great students.".center(80)
  elsif students.count == 0
    puts "There are currently #{students.count} students enrolled at Villains Academy".center(80)
  else
    puts "Overall, we have #{students.count} great students.".center(80)
  end
end

students = input_students

if students.count > 0
  print_header
  print(students)
  print_footer(students)
end
