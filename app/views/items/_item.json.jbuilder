json.extract! item, :id, :name, :sku, :price, :cost, :pawned, :released_at, :stocked_at, :sold_at, :created_at, :updated_at
json.url item_url(item, format: :json)
