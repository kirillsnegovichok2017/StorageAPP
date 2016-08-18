class Folder < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  has_many :records, dependent: :destroy
  has_many :folders, dependent: :destroy

  validates :name, presence: true , length: {maximum: 255 }
  #validates :info, presence: true
  #validates :user_id, presence: true

  def owner
    user.name
  end

  def has_child_folders?
    return folders.any?
  end

  def has_child_records?
    return records.any?
  end

  def root?
    return (root.nil? or root==false) ? false : true
  end

  def path
    if root?
      return user.name
    end
    _path = name
    parent = folder

    while not parent.root?
      _path = "#{parent.name}/" + _path
      parent = parent.folder
    end
    _path = "#{parent.user.name}/" + _path
    _path
  end

end
