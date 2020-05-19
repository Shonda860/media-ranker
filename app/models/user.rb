class User < ApplicationRecord
  has_many :votes
  has_many :works, :through => :votes
  validates :username, presence: true, uniqueness: true
end
