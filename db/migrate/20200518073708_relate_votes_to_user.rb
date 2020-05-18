class RelateVotesToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference  :votes,:users, index: true, foregin_key: true
  end
end
