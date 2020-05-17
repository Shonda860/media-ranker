class FixSpellingOnDescriptionColumnInWorks < ActiveRecord::Migration[6.0]
  def change
    rename_column :works, :decription, :description
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
