class RenameDescriptonColumnInWorks < ActiveRecord::Migration[6.0]
  def change
    rename_column :works, :descripton, :decription
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
