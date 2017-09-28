FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "#{n}example@email.com"}
    sequence(:name){|n|"john #{n}doe"}
    password 'password'
    factory :user_with_avatar do
      avatar { File.new("#{Rails.root}/spec/support/fixtures/thumb.jpg") }
    end
  end
end
