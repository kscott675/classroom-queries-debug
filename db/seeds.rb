require "faker"

# Create 200 fake students
200.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
  )
end

seasons = ["Spring", "Summer", "Fall", "Winter"]

# Select a random season
random_season = seasons.sample

# Create 200 fake courses and departments with the same department ID
200.times do
  Course.create!(
    title: Faker::Educator.course_name,
    term_offered: random_season,
    department_id: rand(1..7)
  )
end

200.times do
  Department.create!(
    name: Faker::Educator.subject,
  )
end
