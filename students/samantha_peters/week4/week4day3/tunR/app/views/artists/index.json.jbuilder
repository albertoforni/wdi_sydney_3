json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :members, :formed, :image, :website
  json.url artist_url(artist, format: :json)
end
