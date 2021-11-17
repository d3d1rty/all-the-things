class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :item, null: false, foreign_key: true
      t.decimal :sale_price, precision: 7, scale: 2
      t.decimal :profit, precision: 7, scale: 2
      t.decimal :calculated_tax, precision: 7, scale: 2
      t.datetime :date_of_sale

      t.timestamps
    end
  end
end
