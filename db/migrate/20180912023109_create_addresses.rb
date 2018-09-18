class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :string
      t.string :country
      t.references :customer, index: true

      t.timestamps
    end
  end
end
