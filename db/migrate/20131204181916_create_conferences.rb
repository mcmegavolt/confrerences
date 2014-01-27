class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title
      t.text :description
      t.string :file
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
