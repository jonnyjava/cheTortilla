class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.integer :status

      t.timestamps
    end
  end
end
