json.array!(@categories) do |categorie|
  json.extract! categorie, :id, :omschrijving
  json.url categorie_url(categorie, format: :json)
end
