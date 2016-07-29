class AddFolderToUser < ActiveRecord::Migration
  def change
    add_reference :users, :folder, index: true, foreign_key: true
  end
end
