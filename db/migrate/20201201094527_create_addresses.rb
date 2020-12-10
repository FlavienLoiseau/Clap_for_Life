class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :number,             default: "", null: false
      t.string :street,             default: "", null: false
      t.string :city,               default: "", null: false
      t.string :zipcode,            default: "", null: false
      t.string :country,            default: "", null: false
      t.references :addressable,    polymorphic: true

      t.timestamps
    end
  end
end
