class RelateUsersToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :votes, index: true
  end
end
