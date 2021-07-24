class AddImageIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :image_id, :string
  end
end
