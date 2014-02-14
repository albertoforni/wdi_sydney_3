json.array!(@students) do |student|
  json.extract! student, :id, :name, :description, :image_url, :email
  json.url student_url(student, format: :json)
end
