class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :additional
      t.string :city
      t.string :zipcode
      t.string :country
      t.references :addressable,    polymorphic: true

      t.timestamps
    end
  end
end
