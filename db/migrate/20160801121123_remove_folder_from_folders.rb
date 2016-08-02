class RemoveFolderFromFolders < ActiveRecord::Migration
  def change
    remove_reference :folders, :folder, index: true, foreign_key: true
  end
end
