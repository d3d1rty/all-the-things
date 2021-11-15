json.extract! loan, :id, :customer_id, :item_id, :principal, :interest_rate, :maturity_date, :default_date, :created_at, :updated_at
json.url loan_url(loan, format: :json)
