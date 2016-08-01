class Folder < ActiveRecord::Base
  belongs_to :folder
  belongs_to :user
  has_many :folders

  validates :name, presence: true , length: {maximum: 50 }
  #validates :info, presence: true
  validates :user_id, presence: true
end
