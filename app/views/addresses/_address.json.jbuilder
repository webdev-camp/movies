json.extract! address, :id, :Street, :Postcode, :City, :Country, :user, :created_at, :updated_at
json.url address_url(address, format: :json)
