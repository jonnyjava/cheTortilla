require 'rails_helper'

describe User do
  it { should have_many(:participations) }
  it { should have_many(:dishes) }
end
