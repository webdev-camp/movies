FactoryGirl.define do
  factory :person do
    sequence(:name){|n|"john #{n}doe"}
    bio "A bio"
    tmdb_id 1234
    imdb_id 'nm04859'
    birthday '16/11/89'
    born_in 'Birmingham'
  end
end
