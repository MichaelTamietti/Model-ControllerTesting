FactoryBot.define do
    factory :school, class: School do
      name 'School Example'
      address 'Street 1, SLC'
      principal 'John Smith'
      capacity 3
      private_school true
    end
  end