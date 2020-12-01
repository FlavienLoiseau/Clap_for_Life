class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.references :user, index: true
      t.references :mission, index: true
      t.timestamps
    end
  end
end
