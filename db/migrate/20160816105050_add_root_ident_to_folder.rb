class AddRootIdentToFolder < ActiveRecord::Migration
  def change
    add_column :folders, :root, :boolean, default: false
  end
end
