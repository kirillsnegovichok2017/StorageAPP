class AddFolderToFolder < ActiveRecord::Migration
  def change
    add_reference :folders, :folder, index: true, foreign_key: true
  end
end
