class User < ActiveRecord::Base
  has_many :participations
  has_many :dishes

  def status
    participation.status
  end
end
