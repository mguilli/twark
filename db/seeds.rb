# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


WebApp.create(name: "Test Web App", token: "af0543dff939f056")

token = SecureRandom.hex(8)

WebApp.create(name: "Another Web App", token: token)

50.times do
  event = Event.create( name: "link-click", web_app_id: 1 )
  event.update_attribute(:created_at, rand(1.day .. 1.month).ago)
end

5.times do
  event = Event.create( name: "test-link", web_app_id: 2 )
  event.update_attribute(:created_at, rand(1.day .. 2.weeks).ago)
end

5.times do
  event = Event.create( name: "page-test", web_app_id: 2 )
  event.update_attribute(:created_at, rand(1.day .. 2.weeks).ago)
end

puts "#{WebApp.count} Web Apps created."
puts "#{Event.count} Events created."