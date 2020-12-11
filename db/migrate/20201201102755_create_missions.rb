class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.references :organisation,     index: true
      t.string :title,                null: false
      t.string :contact_first_name,   null: false
      t.string :contact_last_name,    null: false
      t.string :contact_phone,        null: false
      t.text :description,            null: false
      t.datetime :start_date,         null: false
      t.datetime :end_date,           null: false
      t.integer :volunteers_needed,   null: false
      t.timestamps
    end
  end
end
