class AddFieldsToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :photoId, :bigint
    add_column :experiences, :title, :string
    add_column :experiences, :notes, :text
  end
end
