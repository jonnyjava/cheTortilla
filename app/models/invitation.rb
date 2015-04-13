class Invitation < ActiveRecord::Base
  belongs_to :event
  validates :email, presence: true, uniqueness: {scope: :event_id}
  after_create :notify_invited

  scope :by_event, ->(event) { where(event: event) }
  scope :by_email, ->(email) { where(email: email) }

  def notify_invited
    InvitationMailer.invitation_email(self).deliver
  end

  def verification_token
    token = [email, event_id, created_at, 'che tortilla beve tequila'].join
    Digest::SHA1.hexdigest(token)
  end

  def self.find_by_token(token)
    invitation = nil
    Invitation.all.each do |i|
      next unless i.verification_token == token
      invitation = i
      break
    end
    invitation
  end
end
