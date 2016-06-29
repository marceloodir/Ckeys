json.array!(@authorizations) do |authorization|
  json.extract! authorization, :id, :professor_id, :user_id, :room_id, :date_register, :date_expiration
  json.url authorization_url(authorization, format: :json)
end
