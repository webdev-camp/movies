FactoryGirl.define do
  factory :person do
    sequence(:name){|n|"john #{n}doe"}
    bio "A bio"
    # TODO Add new columns to factory
  end
end
