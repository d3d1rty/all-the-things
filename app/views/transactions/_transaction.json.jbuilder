json.extract! transaction, :id, :item_id, :sale_price, :profit, :calculated_tax, :date_of_sale, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
