require 'rails_helper'

describe Event do
  it { should have_many(:participations) }
  it { should have_many(:dishes) }
end
