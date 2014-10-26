class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :scheduled

      t.timestamps
    end
  end
end
