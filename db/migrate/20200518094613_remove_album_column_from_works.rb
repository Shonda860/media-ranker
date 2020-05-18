class RemoveAlbumColumnFromWorks < ActiveRecord::Migration[6.0]
  def change
    remove_column :works, :album
  end
end
