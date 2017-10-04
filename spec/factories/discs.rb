FactoryGirl.define do
  factory :disc do
    user
    movie
    owns false
    factory :disc_for_sale do
      dvd
      owns true
    end
  end
end
