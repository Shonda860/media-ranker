class Work < ApplicationRecord
  validates :title, :creator, :publication_year, :description, presence: true

  def self.by_category
    categories = {"albums"=>[], "book" => [], "movie"=>[]}
    categories.each do |category,record|
      set = select{ |work| work.category == category}
      categories[category] = set
      end
        return categories
      # Work.all.where(category: "album").limit(10).sort.each do |work|
    # work[:title]
    # work[:creator]
    # end

  end
end
