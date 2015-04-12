class InvitationMailer < ActionMailer::Base
  default from: "che@tortilla.com"

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: invitation.email, subject: 'CheTortilla invitation')
  end
end
