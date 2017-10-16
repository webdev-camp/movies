FactoryGirl.define do
  factory :disc do
    user
    movie
    owns false
    factory :disc_on_shelf do
      dvd
      owns true
    end
    factory :disc_for_sale do
      dvd
      selling true
      owns true
    end
    factory :disc_with_review do
      review
    end

    
  end
end
