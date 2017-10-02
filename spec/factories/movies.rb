FactoryGirl.define do
  factory :movie do
    sequence(:title){|n| "#{n}movie title"}
    sequence(:summary){|n|"#{n}movie summary"}
    language 'Mystring'
    tmdb_id 12345
    imdb_id 'jd9939j'
    tmdb_vote 85
    revenue 2000000
    budget 3000000
    factory :movie_with_poster do
      poster { File.new("#{Rails.root}/spec/support/fixtures/thumb.jpg") }
    end
  end
end
