require 'rails_helper'

describe Invitation do
  it { should belong_to(:event) }
  it { should validate_presence_of :email }

  it "an email cannot be invited twice to the same event" do
    event = FactoryGirl.create(:event)
    invitation = FactoryGirl.create(:invitation, event_id: event.id)
    invalid_invitation =FactoryGirl.build(:invitation, event_id: event.id, email: invitation.email)
    expect(invalid_invitation).to be_invalid
  end

  it "an email can be invited to two different events" do
    event1 = FactoryGirl.create(:event)
    event2 = FactoryGirl.create(:event)
    first_invitation = FactoryGirl.create(:invitation, event_id: event1.id)
    second_invitation =FactoryGirl.build(:invitation, event_id: event2.id, email: first_invitation.email)
    expect(second_invitation).to be_valid
  end
end
