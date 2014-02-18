json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :genre, :image, :isbn, :author_id
  json.url book_url(book, format: :json)
end
