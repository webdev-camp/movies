FactoryGirl.define do
  factory :charge do
    user_id 1
    amount 1
    description "MyText"
    purchase_id 1
    currency "MyString"
  end
end
