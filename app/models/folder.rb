class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :name, presence: true , length: {maximum: 255 }
  #validates :info, presence: true
  validates :user_id, presence: true
end
