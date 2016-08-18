class User < ActiveRecord::Base
  has_secure_password

  before_save {email.downcase!}
  after_create :create_root_folder

  has_one :root, -> { where(root: true) }, dependent: :destroy, class_name: 'Folder'
  has_many :records, through: :folder
  has_many :folders, class_name: 'Folder'


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensetive: false}
  #validates :folder_id, presence: true
  validates :password, length: { minimum: 6 }

  private
  def create_root_folder
    create_root(name: '/', root: true)
    #folders.create(name: 'root', info: 'root')
  end
end
