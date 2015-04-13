require 'rails_helper'

describe Event do
  it { should belong_to(:user) }
  it { should have_many(:invitations) }
  it { should have_many(:participations) }
  it { should have_many(:dishes) }
end
