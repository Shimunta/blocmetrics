# Create Users
3.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password"
  )
end
users = User.all
# Create Apps
10.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    URL: Faker::Internet.url,
    user: users.sample
  )
end
apps = RegisteredApplication.all
#Create Events
50.times do
  Event.create!(
    name: Faker::Superhero.name,
    registered_application: apps.sample
  )
end

puts "Seeding Completed"
puts "#{User.count} users created!"
puts "#{RegisteredApplication.count} apps created!"
puts "#{Event.count} events created!"
