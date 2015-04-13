class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :participations
  has_many :dishes

  scope :by_creator, ->(user){ where(user: user) }
  scope :where_user_is_invited, ->(user){ includes(:invitations).where(invitations: {email: user.email}) }
end
