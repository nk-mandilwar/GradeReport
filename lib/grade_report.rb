require_relative './students'
require_relative './constants'

module GradeReport
  extend self

  def generate(students)
    students_list_by_grade = find_students_list_by_grade(students)
    avg_per_grade = calculate_avg_per_grade(students_list_by_grade)
    above_avg, below_avg = 0, 0
    display_header
    students.each_value do |student|
      performance = compare_avg(student.total, avg_per_grade[student.grade])
      display_row(student, performance)
      above_avg += 1 if performance == ABOVE
      below_avg += 1 if performance == BELOW
    end
    display_footer(students_list_by_grade, above_avg, below_avg)
  end

  def find_students_list_by_grade(students)
    list = {}
    GRADES.each do |grade|
      list[grade] = students.list_by_grade(grade)
    end
    list
  end

  def calculate_avg_per_grade(students_list_by_grade)
    avg = {}
    students_list_by_grade.keys.each do |grade|
      total = 0
      students_list_by_grade[grade].each do |student|
        total += student.total
      end
      avg[grade] = total / students_list_by_grade[grade].length.to_f
    end
    avg
  end

  def display_header
    puts ' ID Subject1 Subject2 Subject3 Subject4 Grand-Total Grade Average-Compare'
  end

  def compare_avg(total, avg)
    if total >= avg
      ABOVE
    elsif total < avg
      BELOW
    end
  end

  def display_row(student, performance)
    row = "|%02d|" %student.id 
    student.each_value do |mark|
      row += "%5d   |" %mark
    end
    row += "%7d    |" %student.total
    row += "%3s  |" %student.grade  
    row += "%10s     |" %performance
    puts row
  end

  def display_footer(students_list_by_grade, above_avg, below_avg)
    draw_line
    puts "\n\n"
    draw_line
    puts "Grade Report"
    students_list_by_grade.keys.each do |grade|
      puts "Number of students in #{grade} Grade :: #{students_list_by_grade[grade].length}"
    end
    puts "Number of students above their grade average :: #{above_avg}"
    puts "Number of students below their grade average :: #{below_avg}"
    draw_line
  end

  def draw_line
    puts '---------------------------------------------------------------------------'
  end

end