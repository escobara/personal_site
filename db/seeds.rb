# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
Page.create(title: 'Sample Home Page', body: 'Hello World', parent_id: nil, page_type: 'Home' )