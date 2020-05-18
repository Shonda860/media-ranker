class MasterFixOnVotesTable < ActiveRecord::Migration[6.0]
  def change
   remove_reference  :votes,:users, index: true
   remove_reference  :votes,:works, index: true
   add_reference :votes,:work, index: true, foreign_key: true
   add_reference :votes,:user, index: true, foreign_key: true
  end
end
