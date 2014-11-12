# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


advertisements = [{"size" => "3x3", "price" => 3000}, {"size" => "1x3","price" => 1000}, {"size" => "2x3","price" => 2500}, {"size" => "3x3","price" => 5000}, {"size" => "1x1", "price" => "1000"}, {"size" => "1x2", "price" => "1200"}, {"size" => "1x1", "price" => "800"},{"size" => "2x3", "price" => "2000"}]

advertisements.each do |advertisement|
  Advertisement.create(advertisement)
end
