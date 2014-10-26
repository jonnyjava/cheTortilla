class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
