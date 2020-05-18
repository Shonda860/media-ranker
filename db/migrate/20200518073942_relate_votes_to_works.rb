class RelateVotesToWorks < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes,:works, index: true, foregin_key: true
  end
end
