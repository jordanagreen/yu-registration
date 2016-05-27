json.array!(@courses) do |course|
  json.extract! course, :id, :department, :course_number, :title
  json.url course_url(course, format: :json)
end
