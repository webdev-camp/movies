FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "#{n}example@email.com"}
    sequence(:name){|n|"john #{n}doe"}
    password 'password'
    confirmed_at Time.now
    factory :user_with_avatar do
      avatar { File.new("#{Rails.root}/spec/support/fixtures/thumb.jpg") }
    end
    factory :admin do
      sequence( :email) { |n| "admin#{n}@test.com" }
      role 'admin'
    end
    factory :user_with_5_discs do
      after(:create) do |user|
        create_list(:disc, 5, user: user)
      end
    end

    factory :user_with_address do
      address
    end
  end

end
