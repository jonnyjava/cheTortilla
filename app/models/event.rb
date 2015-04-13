class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :participations
  has_many :dishes

  scope :by_creator, ->(user){ where(user: user) }
  scope :by_participation, ->(user){ includes(:participations).where(participations: {user: user}) }
end
