class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :sku
      t.decimal :price
      t.decimal :cost
      t.boolean :pawned
      t.datetime :released_at
      t.datetime :stocked_at
      t.datetime :sold_at
      t.text :description

      t.timestamps
    end
  end
end
