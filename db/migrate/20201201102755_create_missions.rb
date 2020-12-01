class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.references :organisation,     index: true
      t.string :title
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_phone
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :volunteers_needed
      t.timestamps
    end
  end
end
