json.array!(@users) do |user|
  json.extract! user, :id, :name, :type_of, :image
  json.url user_url(user, format: :json)
end
