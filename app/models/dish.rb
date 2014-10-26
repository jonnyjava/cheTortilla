class Dish < ActiveRecord::Base
  belongs_to :user, class_name: "chef", foreign_key: "user_id"
  belongs_to :event
end
