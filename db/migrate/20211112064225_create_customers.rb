class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_one
      t.string :address_line_two
      t.string :state
      t.string :city
      t.string :zip
      t.string :phone_number

      t.timestamps
    end
  end
end
