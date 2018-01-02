class CreateSavedPoems < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_poems do |t|

      t.timestamps
    end
  end
end
