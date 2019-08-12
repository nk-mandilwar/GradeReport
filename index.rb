require_relative './lib/csv_parser'
require_relative './lib/grade_report'

begin
  students = CsvParser.fetch_student_records(ARGV[0])
  GradeReport.generate(students)
rescue Errno::ENOENT => e
  puts e.message
rescue Execption => e 
  puts e.message
end 