class AddTranslations < ActiveRecord::Migration
  def up
    Category.create_translation_table! :title => :string
    Conference.create_translation_table! :title => :string, :description => :text
  end
  def down
    Category.drop_translation_table!
    Conference.drop_translation_table!
  end
end