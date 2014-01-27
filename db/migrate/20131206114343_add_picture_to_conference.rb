class AddPictureToConference < ActiveRecord::Migration
  def change
    add_column :conferences, :picture, :string
  end
end
