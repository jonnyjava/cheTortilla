class Event < ActiveRecord::Base
  belongs_to :user
  has_many :invitations
  has_many :participations
  has_many :dishes
end
