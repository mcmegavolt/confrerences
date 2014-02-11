class CreateAdvertisings < ActiveRecord::Migration
  def change
    create_table :advertisings do |t|
      t.string :title
      t.text :body
      t.string :audience
      t.references :conference, index: true

      t.timestamps
    end
  end
end
