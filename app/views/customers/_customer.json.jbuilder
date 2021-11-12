json.extract! customer, :id, :first_name, :last_name, :address_line_one, :address_line_two, :state, :city, :zip, :phone_number, :created_at, :updated_at
json.url customer_url(customer, format: :json)
