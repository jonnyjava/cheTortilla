class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :participations
  has_many :dishes

  def status
    participation.status
  end

  def accept_participation(event)
    Participation.create(event: event, user: self, status: Participation::CHEF)
  end
end
