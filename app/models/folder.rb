class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :records

  validates :name, presence: true , length: {maximum: 50 }
  #validates :info, presence: true
  #validates :user_id, presence: true
end
