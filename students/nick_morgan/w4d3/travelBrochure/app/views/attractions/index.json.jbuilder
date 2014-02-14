json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :image, :destination_id
  json.url attraction_url(attraction, format: :json)
end
