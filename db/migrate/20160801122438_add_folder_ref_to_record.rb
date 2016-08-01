class AddFolderRefToRecord < ActiveRecord::Migration
  def change
    add_reference :records, :folder, index: true, foreign_key: true
  end
end
