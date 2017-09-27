FactoryGirl.define do
  factory :movie do
    sequence(:title){|n| "#{n}movie title"}
    sequence(:summary){|n|"#{n}movie summary"}
    avatar ""
  end
end
