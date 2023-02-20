class AddPictureToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :picture, :string
  end
end
