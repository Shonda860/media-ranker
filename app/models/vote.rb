class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.new_vote(user_id:, work_id:)
    work = Work.find_by(id: work_id)
    user = User.find_by(id: user_id)
    if !user || !work
      return nil
    else
      return Vote.new(user_id: user, work_id: work)
    end
  end
end
