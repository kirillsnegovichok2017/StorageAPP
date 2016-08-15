class Folder < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  has_many :records, dependent: :destroy
  has_many :folders, dependent: :destroy

  validates :name, presence: true , length: {maximum: 255 }
  #validates :info, presence: true
  validates :user_id, presence: true



  def owner
    user.name
  end

  def has_child_folders?
    return folders.any?
  end

  def has_child_records?
    return records.any?
  end

end
