class AddUserRefToFolder < ActiveRecord::Migration
  def change
    add_reference :folders, :user, index: true, foreign_key: true
  end
end
