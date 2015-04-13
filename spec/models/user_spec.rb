require 'rails_helper'

describe User do
  it { should have_many(:participations) }
  it { should have_many(:dishes) }

  describe "accept_participation" do
    it "should create a participation" do
      participations_size = Participation.all.size
      user = FactoryGirl.create(:user)
      invitation = FactoryGirl.create(:invitation, email: user.email)
      event = invitation.event
      user.accept_participation(event)
      expect(Participation.all.size).to be_equal(participations_size+1)
      expect(Participation.where(event: event, user: user).size).to be_equal(1)
    end
  end
end
