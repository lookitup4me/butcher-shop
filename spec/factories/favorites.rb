FactoryGirl.define do
  factory :favorite do
    name "Dinner at Cheesecake Factory"
    cut Cut.find_or_create_by_name("Factory Cut")
  end
end