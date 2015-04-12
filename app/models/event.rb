class Event < ActiveRecord::Base
  has_many :invitations
  has_many :participations
  has_many :dishes
end
