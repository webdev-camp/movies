FactoryGirl.define do
  factory :notification do
    notifiable_type "MyString"
    notifiable_id 1
  end
end
