json.array!(@albums) do |album|
  json.extract! album, :id, :name, :description, :cover_image, :artist_id
  json.url album_url(album, format: :json)
end
