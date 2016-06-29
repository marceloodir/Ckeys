json.array!(@users) do |user|
  json.extract! user, :id, :nome, :matricula
  json.url user_url(user, format: :json)
end
