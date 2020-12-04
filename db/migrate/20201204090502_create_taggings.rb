class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.references :tag,        index: true
      t.references :taggable,   polymorphic: true
      t.timestamps
    end
  end
end
