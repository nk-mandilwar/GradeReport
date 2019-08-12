require_relative '../lib/csv_parser'

describe CsvParser do

  it 'should return sub marks hash' do
    sub_marks = ["S1­88","S2­53","S3­69","S4­64"]
    marks = CsvParser.set_marks(sub_marks)
    mark_hash = {sub_1: 88, sub_2: 53, sub_3: 69, sub_4: 64}
    expect(marks).to eq mark_hash
  end

  it 'should return students object' do
    students = CsvParser.fetch_student_records('../result.txt')
    expect(students.class).to eq Students::Students
  end
end