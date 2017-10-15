FactoryGirl.define do
  factory :address do
    street "unit and street"
    postcode "postal code"
    city "name of city"
    country "country name"

    user
  end
end
