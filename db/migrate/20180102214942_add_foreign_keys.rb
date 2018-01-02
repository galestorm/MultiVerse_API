class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    add_reference :saved_poems, :user, index: true
    add_reference :saved_poems, :poem, index: true

    add_reference :experiences, :user, index: true
    add_reference :experiences, :poem, index: true
  end
end
