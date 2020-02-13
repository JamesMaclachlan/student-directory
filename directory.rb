@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # get the first name
  name = STDIN.gets.chomp.capitalize
  # while the name is empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    @students << {name: name, cohort: :November}
      puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp.capitalize
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "____________________"
  puts "Please choose from the following:"
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list."
  puts "4. Load a list."
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
    puts "Program exited."
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
    puts "Overall, we have #{@students.count} great student."
  else
    puts "Overall, we have #{@students.count} great students."
  end
end

def save_students
  puts "What would you like to call the file?"
  named_save_file = gets.chomp
  # open the file for writing
  file = File.open(named_save_file, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    named_save_file = student_data.join(",")
    file.puts named_save_file
  end
  file.close
  puts "Students saved to system."
end

def load_students
  puts "Which file would you like to load?"
  named_load_file = gets.chomp
  file = File.open(named_load_file, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Students loaded to list, Press '2' to view."
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
