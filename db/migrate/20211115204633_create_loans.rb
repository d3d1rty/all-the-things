class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.decimal :principal, precision: 9, scale: 2
      t.decimal :interest_rate, precision: 7, scale: 2
      t.datetime :maturity_date
      t.datetime :default_date

      t.timestamps
    end
  end
end
