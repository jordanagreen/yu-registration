json.array!(@courses) do |course|
  json.extract! course, :id, :department, :number, :title
  json.url course_url(course, format: :json)
end
