class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :icon
      t.string :picture

      t.timestamps
    end
  end
end
