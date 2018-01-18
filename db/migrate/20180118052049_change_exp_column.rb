class ChangeExpColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :experiences, :photoId, :photo_id
  end
end
