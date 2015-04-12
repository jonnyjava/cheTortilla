FactoryGirl.define do
  factory :invitation do
    event FactoryGirl.create(:event)
    email Faker::Internet.email
  end
end
