json.extract! product, :id, :title, :description, :sold, :content, :created_at, :updated_at
json.url product_url(product, format: :json)
