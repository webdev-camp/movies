FactoryGirl.define do
  factory :card do
    user
    movie
    owns false
    factory :card_on_shelf do
      owns Time.now
    end
    factory :card_for_sale do
      dvd
      selling Time.now
      owns Time.now
    end
    factory :card_with_review do
      review
    end


  end
end
