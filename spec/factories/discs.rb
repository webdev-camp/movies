FactoryGirl.define do
  factory :disc do
    user
    movie
    owns false
  end
end
