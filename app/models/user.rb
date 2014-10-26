class User < ActiveRecord::Base
  has_many :participations
end
