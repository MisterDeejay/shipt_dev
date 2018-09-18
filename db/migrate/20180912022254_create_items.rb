class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.decimal :quantity
      t.references :listable, polymorphic: true, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end
