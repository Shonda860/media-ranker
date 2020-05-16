class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :category
      t.string :title
      t.string :creator
      t.string :publication_year
      t.string :descripton
      t.string :album

      t.timestamps
    end
  end
end
