FactoryGirl.define do
  factory :movie do
    sequence(:title){|n| "#{n}movie title"}
    sequence(:summary){|n|"#{n}movie summary"}
    factory :movie_with_avatar do
      avatar { File.new("#{Rails.root}/spec/support/fixtures/thumb.jpg") }
    end
  end
end
