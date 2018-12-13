FactoryBot.define do
  factory :student, class: Student do
    name { "BOB" }
    student_number { 123 }
    gpa { 2.0 }
    school
  end
end