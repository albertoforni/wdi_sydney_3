json.array!(@albums) do |album|
  json.extract! album, :id, :name, :year, :genre, :album_art, :artist_id
  json.url album_url(album, format: :json)
end
