json.array!(@destinations) do |destination|
  json.extract! destination, :id, :name, :image, :country
  json.url destination_url(destination, format: :json)
end
