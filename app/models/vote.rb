class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :work_id, presence: true
  validates :user_id, presence: true,uniqueness: {scope: :work_id, message: "you have already voted for this works"}

  def self.new_vote(user_id:, work_id:)
    work = Work.find_by(id: work_id)
    user = User.find_by(id: user_id)
    if !user || !work
      return nil
    else
      return Vote.new(user_id: user_id, work_id: work_id)
    end
  end

end
