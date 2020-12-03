class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :number, default: ""
      t.string :street, default: ""
      t.string :additional, default: ""
      t.string :city, default: ""
      t.string :zipcode, default: ""
      t.string :country, default: ""
      t.references :addressable,    polymorphic: true

      t.timestamps
    end
  end
end
