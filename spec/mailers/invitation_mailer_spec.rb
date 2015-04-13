require "rails_helper"

describe InvitationMailer do
  it "should send an email to the invitation address" do
    invitation = FactoryGirl.create(:invitation)
    sent_email = InvitationMailer.invitation_email(invitation)
    expect(sent_email).to deliver_to(invitation.email)
    expect(sent_email).to have_subject(/CheTortilla invitation/)
    expect(sent_email).to have_body_text(/#{invitation.event.scheduled}/)
    expect(sent_email).to have_body_text(/#{accept_invitation_url(invitation.verification_token)}/)
    expect(sent_email).to have_body_text(/#{reject_invitation_url(invitation.verification_token)}/)
  end
end
