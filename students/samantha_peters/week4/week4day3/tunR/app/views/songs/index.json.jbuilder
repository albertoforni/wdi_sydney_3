json.array!(@songs) do |song|
  json.extract! song, :id, :name, :length, :youtube, :album_id, :artist_id, :image
  json.url song_url(song, format: :json)
end
