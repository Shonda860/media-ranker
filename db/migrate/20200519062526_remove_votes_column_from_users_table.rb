class RemoveVotesColumnFromUsersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :votes
  end
end
