require 'rails_helper'

RSpec.describe Dish, :type => :model do
  it { should belong_to(:chef).class_name('User') }
  it { should belong_to(:chef).conditions(status: :chef) }
  it { should belong_to(:chef).with_foreign_key('user_id') }
end
