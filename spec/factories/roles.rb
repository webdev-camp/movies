FactoryGirl.define do
  factory :role do
    person_name "MyString"
    character_name "MyString"

    association :person, factory: :person
    association :movie, factory: :movie
  end
end
