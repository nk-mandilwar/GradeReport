require_relative '../lib/grade_report'

describe GradeReport do

  let(:student1) {Students::Student.new(1, {sub_1: 90, sub_2: 80, sub_3: 75, sub_4: 85})}
  let(:student2) {Students::Student.new(2, {sub_1: 50, sub_2: 80, sub_3: 75, sub_4: 85})}
  let(:student3) {Students::Student.new(3, {sub_1: 55, sub_2: 80, sub_3: 75, sub_4: 85})}

  it 'should compare avg mark of students and total mark of a student' do
    res = GradeReport.compare_avg(300, 280)
    expect(res).to eq 'ABOVE'
  end

  it 'should return an hash with list of students per grade' do
    students = Students::Students.new
    students.add(student1)
    students.add(student2)
    students.add(student3)
    res = GradeReport.find_students_list_by_grade(students)
    list = {"A" => [], "B" => [student1], "C" => [student2, student3]}
    expect(res).to eq list
  end

  it 'should return avg of total marks per grade for all students' do  
    student4 = Students::Student.new(3, {sub_1: 100, sub_2: 80, sub_3: 75, sub_4: 85})
    students_list_by_grade = {"A" => [student4], "B" => [student1], "C" => [student2, student3]}
    res = GradeReport.calculate_avg_per_grade(students_list_by_grade)
    avg_per_grade = {"A" => 340.0, "B" => 330.0, "C" => (290+295)/2.0}
    expect(res).to eq avg_per_grade
  end

end
