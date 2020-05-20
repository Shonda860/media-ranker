class Work < ApplicationRecord
  has_many :votes
  validates :title, :creator, :publication_year, :description, presence: true

  def self.category
    categories = {"album" => [], "book" => [], "movie" =>[]}
    categories.each do |category,record|
      set = all.select{ |work| work.category == category}
      categories[category] = set
      end
        return categories
  end

 

end
