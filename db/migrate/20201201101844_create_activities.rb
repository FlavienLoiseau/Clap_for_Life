class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :code,           null: false
      t.string :title,          null: false
      t.string :description,    null: false

      t.timestamps
    end
  end
end
