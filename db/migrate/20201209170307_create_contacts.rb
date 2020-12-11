class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name,     null: false
      t.string :last_name,      null: false
      t.string :email,          null: false
      t.string :email_content,  null: false

      t.timestamps
    end
  end
end
