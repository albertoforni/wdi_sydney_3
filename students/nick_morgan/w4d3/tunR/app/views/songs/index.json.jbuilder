json.array!(@songs) do |song|
  json.extract! song, :id, :name, :length, :description, :album_id, :artist_id
  json.url song_url(song, format: :json)
end
