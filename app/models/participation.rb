class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  enum status: [ :invited, :chef ]

  CHEF = statuses[:chef]
end
