class AddConferenceReferenceAndIndexesToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :conference_id, :integer
  	add_index :articles, :conference_id
  	add_index :articles, :category_id
  end
end
