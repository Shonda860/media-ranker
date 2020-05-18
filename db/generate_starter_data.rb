require "faker"
require "date"
require "csv"

# we already provide a filled out works_seeds.csv file, but feel free to
# run this script in order to replace it and generate a new one
# run using the command:
# $ ruby db/generate_seeds.rb
# if satisfied with this new works_seeds.csv file, recreate the db with:
# $ rails db:reset
# doesn't currently check for if titles are unique against each other

# CSV.open("db/works_seeds.csv", "w", :write_headers => true,
#                                     :headers => ["category", "title", "creator", "publication_year", "description"]) do |csv|
#   25.times do
#     category = %w(album book).sample
#     title = Faker::Coffee.blend_name
#     creator = Faker::Name.name
#     publication_year = rand(Date.today.year - 100..Date.today.year)
#     description = Faker::Lorem.sentence

#     csv << [category, title, creator, publication_year, description]
#   end
# end
# File.open("db/users_seeds.csv", "a+",:write_headers => true,
#     :headers => ["username", "votes", "joined"]) do |file|
# 25.times do
# username = Faker::FunnyName.name
# votes = 0
# joined = rand(Date.today - 100..Date.today)
# file << [username, votes, joined]
# puts "done"
# end
# end

