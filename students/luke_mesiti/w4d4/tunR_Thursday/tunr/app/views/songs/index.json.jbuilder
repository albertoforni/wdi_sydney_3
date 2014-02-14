json.array!(@songs) do |song|
  json.extract! song, :id, :name, :length, :description
  json.url song_url(song, format: :json)
end
