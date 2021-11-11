class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :sku
      t.decimal :price, precision: 7, scale: 2
      t.decimal :cost, precision: 7, scale: 2
      t.boolean :pawned
      t.datetime :released_at
      t.datetime :stocked_at
      t.datetime :sold_at

      t.timestamps
    end

    add_index :items, :sku
  end
end
