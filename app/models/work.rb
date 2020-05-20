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
  # def self.top_ten
  #   categories = {"Top Album" => [], "Top Book" => [], "Top Movie" =>[]}
  #   categories.each do |category,record|
  #   sorted_works = all.sort_by {|work| - work.votes.length}
  #     categories[record] = sorted_works
  #   end
  #   return categories
  # end
  def self.top_ten(type)
    categories = {"Top Album" => [], "Top Book" => [], "Top Movie" =>[]}
    sorted_works = all.sort_by {|work| -work.votes.length}
    works_listed = []
    sorted_works.each do |work|
      if work.category == category
        works_listed << work
      end
    end
    return sorted_works
  end

end
