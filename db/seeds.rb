# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Story.create(title: "Reddit", 
		description: "Links upon links", 
		link: "http://reddit.com")


Story.create(title: "Google", 
		description: "Search and things", 
		link: "http://google.com")


Story.create(title: "Steer", 
		description: "Code School", 
		link: "http://steer.me")