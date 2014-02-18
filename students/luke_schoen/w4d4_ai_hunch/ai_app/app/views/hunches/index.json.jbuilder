json.array!(@hunches) do |hunch|
  json.extract! hunch, :id, :name, :description
  json.url hunch_url(hunch, format: :json)
end
