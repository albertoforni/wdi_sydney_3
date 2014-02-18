json.array!(@senses) do |sense|
  json.extract! sense, :id, :name, :description, :image
  json.url sense_url(sense, format: :json)
end
