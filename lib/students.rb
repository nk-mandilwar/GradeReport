require 'forwardable'
require_relative './constants'

module Students

  class Student
    extend Forwardable

    def_delegators :@marks, :each_value
    attr_reader :id

    def initialize(id, marks)
      @id = id
      @marks = marks
    end

    def total
      @marks.values.inject(:+)
    end

    def grade
      total = self.total
      if total >= GRADE_A_THRESHOLD
        GRADE_A
      elsif total >= GRADE_B_THRESHOLD
        GRADE_B
      else
        GRADE_C
      end
    end

  end #class Student end

  class Students
    extend Forwardable

    def_delegators :@students, :each_value, :[]
    
    def initialize
      @students = {}
    end

    def add(student)
      @students[student.id] = student
    end

    def list_by_grade(grade)
      students = []
      @students.each_value do |student|
        if grade == student.grade
          students << student
        end
      end
      students
    end

  end #class Students end

end #module Students end
