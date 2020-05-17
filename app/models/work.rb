class Work < ApplicationRecord
  validates :title, :creator, :publication_year, :description, presence: true
end
