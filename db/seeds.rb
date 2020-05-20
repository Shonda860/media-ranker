require "csv"

WORK_FILE = Rails.root.join("db","works-seeds.csv")
puts "Loading raw works data from #{WORK_FILE}"

work_failures = []
CSV.foreach(WORK_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row["category"]
  work.title = row["title"]
  work.creator = row["creator"]
  work.publication_year = row["publication_year"]
  work.description = row["description"]
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else
    puts " Created work: #{work.inspect}"
  end
end

puts "Added #{Work.count} work records"
puts "#{work_failures.length} works failed to save"

puts "Manally resetting PK sequence on each table"

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end


USER_FILE = Rails.root.join("db","users-seeds.csv")
puts "Loading raw works data from #{USER_FILE}"

user_failures = []
CSV.foreach(USER_FILE, :headers => true) do |row|
  user = User.new
  user.username = row["username"]
  user.joined = row["joined"]
 
  successful = user.save
  if !successful
    user_failures << user
    puts "Failed to save work: #{user.inspect}"
  else
    puts " Created work: #{user.inspect}"
  end
end

puts "Added #{User.count} work records"
puts "#{user_failures.length} works failed to save"

puts "Manally resetting PK sequence on each table"

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end


VOTE_FILE = Rails.root.join("db","votes-seeds.csv")
puts "Loading raw works data from #{VOTE_FILE}"

vote_failures = []
CSV.foreach(VOTE_FILE, :headers => true) do |row|
  vote = Vote.new
  vote.user_id = row["user_id"]
  vote.work_id = row["work_id"]
 
  successful = vote.save
  if !successful
   vote_failures << vote
    puts "Failed to save work: #{vote.inspect}"
  else
    puts " Created work: #{vote.inspect}"
  end
end

puts "Added #{Vote.count} vote records"
puts "#{vote_failures.length} vote failed to save"

puts "Manally resetting PK sequence on each table"

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"
