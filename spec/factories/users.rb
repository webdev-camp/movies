FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "#{n}example@email.com"}
    sequence(:name){|n|"john #{n}doe"}
  end
end
