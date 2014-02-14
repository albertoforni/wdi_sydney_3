json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :genre, :image, :isbn
  json.url book_url(book, format: :json)
end
