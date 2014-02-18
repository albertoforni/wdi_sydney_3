json.array!(@robots) do |robot|
  json.extract! robot, :id, :name, :description, :image
  json.url robot_url(robot, format: :json)
end
