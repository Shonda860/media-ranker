class Work < ApplicationRecord
  has_many :votes
  validates :title, :creator, :publication_year, :description, presence: true

  def self.category #for index page
    categories = {"album" => [], "book" => [], "movie" =>[]}
    categories.each do |category,record|
      set = all.select{ |work| work.category == category}
      categories[category] = set
      end
        return categories
  end
  def self.top_ten(category)
  #  all_works = Work.all
   sorted_works = Work.where(category: category).sort_by {|work| -work.votes.count}.reverse!.first(10)
   return sorted_works
  end 
end
