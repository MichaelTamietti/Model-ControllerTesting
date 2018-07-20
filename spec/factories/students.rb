FactoryBot.define do
    factory :student, class: Student do
      name 'Bob'
      student_number 123
      gpa 4.0
      school
    end
  end
