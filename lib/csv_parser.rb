require 'csv'
require_relative './students'

module CsvParser
  extend self

  def fetch_student_records(filename)
    students = Students::Students.new
    CSV.read(filename).each do |row|
      id, *sub_marks = row  
      marks = set_marks(sub_marks)
      student = Students::Student.new(id.to_i, marks)
      students.add(student)
    end
    students
  end

  def set_marks(sub_marks)
    marks = {}
    sub_marks.each_with_index do |sub_mark, i|
      mark = sub_mark.split(173.chr('UTF-8'))[1]
      raise "Incorrect Format" if mark.nil?
      key = "sub_#{i+1}".to_sym
      marks[key] = mark.to_i
    end
    marks
  end

end

      

      

      
