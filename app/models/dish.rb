class Dish < ActiveRecord::Base
  belongs_to :chef, -> { where status: :chef }, foreign_key: "user_id", class_name: 'User'
  belongs_to :event
end
