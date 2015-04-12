class Invitation < ActiveRecord::Base
  belongs_to :event
  validates :email, presence: true, uniqueness: {scope: :event_id}
end
