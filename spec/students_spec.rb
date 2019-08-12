require_relative '../lib/students'

describe Students::Student do
  let(:student) { Students::Student.new(1, {sub_1: 90, sub_2: 80, sub_3: 75, sub_4: 85}) }

  it 'should return total marks of a student' do
    total = student.total
    expect(total).to eq 330
  end 

  it 'should return grade of a student' do
    grade = student.grade
    expect(grade).to eq 'B'
  end
end

describe Students::Students do
  let(:students) { Students::Students.new}

  it 'should add student object' do 
    student = Students::Student.new(1, {sub_1: 90, sub_2: 80, sub_3: 75, sub_4: 85})
    students.add(student)
    expect(students[student.id]).to eq student
  end

  it 'should array of students object' do
    student1 = Students::Student.new(1, {sub_1: 90, sub_2: 80, sub_3: 75, sub_4: 85})
    student2 = Students::Student.new(2, {sub_1: 50, sub_2: 80, sub_3: 75, sub_4: 85})
    student3 = Students::Student.new(3, {sub_1: 55, sub_2: 80, sub_3: 75, sub_4: 85})
    students.add(student1)
    students.add(student2)
    students.add(student3)
    arr = students.list_by_grade('C')
    expect(arr).to eq [student2, student3]
  end
end