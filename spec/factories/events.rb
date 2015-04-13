FactoryGirl.define do
  factory :event do
    user { FactoryGirl.create(:user) }
    scheduled "2014-10-26 13:23:41"
  end
end
