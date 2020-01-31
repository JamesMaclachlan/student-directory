def input_students
  puts "Please enter the names of the students. On the following lines, please enter their: favourite hobby, height and city of birth"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp
  hobby = gets.chomp
  height = gets.chomp
  cob = gets.chomp

  while !name.empty? do

    students << {name: name, cohort: :november, hobby: hobby, height: height, cob: cob}
    puts "Now we have #{students.count} students"

    name = gets.chomp
    break if name.empty?
    hobby = gets.chomp
    height = gets.chomp
    cob = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "-------------".center(80)
end

def print(students)
  students.select{|student| student[:name].start_with?('b') && student[:name].length < 12}.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:hobby]}, #{student[:height]}, #{student[:cob]})".center(80)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(80)
end

students = input_students

print_header
print(students)
print_footer(students)
