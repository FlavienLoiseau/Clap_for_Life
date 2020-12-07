class CreateSashes < ActiveRecord::Migration[6.0]
  def change
    create_table :sashes do |t|
      t.timestamps null: false
    end
  end
end
