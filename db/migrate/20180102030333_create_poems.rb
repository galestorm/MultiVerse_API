class CreatePoems < ActiveRecord::Migration[5.1]
  def change
    create_table :poems do |t|
      t.string :title
      t.string :author
      t.text :lines
      t.text :source

      t.timestamps
    end
  end
end
