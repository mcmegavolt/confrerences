class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :entry
      t.string :file
      t.integer :category_id

      t.timestamps
    end
  end
end
