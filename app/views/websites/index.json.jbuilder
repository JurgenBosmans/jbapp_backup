json.array!(@websites) do |website|
  json.extract! website, :id, :sitenaam, :url, :count, :user_id, :categorie
  json.url website_url(website, format: :json)
end
