class ChangeUidToBeBigint < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :uid, :bigint
  end
end
