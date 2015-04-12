require 'rails_helper'

describe Invitation do
  it { should belong_to(:event) }
  it { should validate_presence_of :email }

  it "should not invite an email twice to the same event" do
    event = FactoryGirl.create(:event)
    invitation = FactoryGirl.create(:invitation, event_id: event.id)
    invalid_invitation =FactoryGirl.build(:invitation, event_id: event.id, email: invitation.email)
    expect(invalid_invitation).to be_invalid
  end

  it "should be able to invite the same email to two different events" do
    event1 = FactoryGirl.create(:event)
    event2 = FactoryGirl.create(:event)
    first_invitation = FactoryGirl.create(:invitation, event_id: event1.id)
    second_invitation =FactoryGirl.build(:invitation, event_id: event2.id, email: first_invitation.email)
    expect(second_invitation).to be_valid
  end

  it "should call notify_invited" do
    invitation = FactoryGirl.build(:invitation)
    expect(invitation).to receive(:notify_invited)
    invitation.save
  end

  it 'should generate an unique token' do
    invitation1 = FactoryGirl.create(:invitation)
    invitation2 = FactoryGirl.create(:invitation)
    token1 = invitation1.verification_token
    token2 = invitation2.verification_token
    expect(token1).not_to equal(token2)
  end

  describe 'find_by_token' do
    it 'should return only one invitation' do
      invitation1 = FactoryGirl.create(:invitation)
      invitation2 = FactoryGirl.create(:invitation)
      token = invitation1.verification_token
      result = Invitation.find_by_token(token)
      expect(result).to eq(invitation1)
      expect(result).not_to eq(invitation2)
    end
  end
end
