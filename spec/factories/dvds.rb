FactoryGirl.define do
  factory :dvd do
    user
    movie
    factory :dvd_for_sale do
      price 10
      condition 'good'
    end
  end
end
