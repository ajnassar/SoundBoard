# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


b1 = Board.create(name: "Test1")
b2 = Board.create(name: "VBS Soundboard")



100.times.each do |x|
  Sound.create(name: Faker::Music.instrument)
end

100.times.each do |x|
  Sound.create(name: Faker::StarWars.character)
end

100.times.each do |x|
  Sound.create(name: Faker::Pokemon.name)
end

30.times.each do |x|
  BoardSound.create(board_id: b1.id, sound_id: rand(1..300))
end

30.times.each do |x|
  BoardSound.create(board_id: b2.id, sound_id: rand(1..300))
end