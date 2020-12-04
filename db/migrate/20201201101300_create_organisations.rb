class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table    :organisations do |t|
      t.references  :user,             index: true
      t.references  :activity,         index: true
      t.string      :name
      t.string      :registration_number
      t.date        :registration_date
      t.text        :description
      t.boolean     :confirmed

      t.timestamps
    end
  end
end
