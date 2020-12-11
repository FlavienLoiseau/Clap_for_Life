class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table    :organisations do |t|
      t.references  :user,                  index: true
      t.references  :activity,              index: true
      t.string      :name,                  null: false
      t.string      :registration_number,   null: false
      t.date        :registration_date,     null: false
      t.text        :description,           null: false
      t.boolean     :confirmed,             default: false

      t.timestamps
    end
  end
end
