class RemoveVoteIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :votes, index: true
  end
end
