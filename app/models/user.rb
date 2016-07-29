class User < ActiveRecord::Base
  after_create :create_root_folder

  has_many :folders, dependent: :destroy
  has_many :records, dependent: :destroy



  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensetive: false}
  #validates :folder_id, presence: true


  private
  def create_root_folder
    folders.create(name: "root", info: "root folder")
  end
end
