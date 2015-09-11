json.array!(@todos) do |todo|
  json.extract! todo, :id, :naam, :beschrijving, :start_datum, :stop_datum, :user_id
  json.url todo_url(todo, format: :json)
end
