FactoryGirl.define do
  factory :role do
    person_name "MyString"
    character_name "MyString"
    # person_id 10
    # movie_id 10
    # person_id {create(:person)}
    # movie_id {create(:movie)}

    association :person, factory: :person
    association :movie, factory: :movie
  end
end
