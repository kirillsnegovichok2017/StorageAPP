class User < ActiveRecord::Base
  include Gravtastic
  gravtastic
  has_secure_password


  attr_accessor :reset_token
  before_save :do_before_save
  after_create :create_root_folder

  has_one :root, -> { where(root: true) }, dependent: :destroy, class_name: 'Folder'
  has_many :records, through: :folder
  has_many :folders, class_name: 'Folder'


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensetive: false}
  #validates :folder_id, presence: true
  validates :password, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end


  private
  def do_before_save
    email.downcase!
    add_pseudo_profile_data
  end

  def create_root_folder
    create_root(name: '/', root: true)
    #folders.create(name: 'root', info: 'root')
  end

  def add_pseudo_profile_data
    self.birth_date = Time.now.to_datetime
    self.country = ' '
    self.language = ' '
    self.mobile = ' '
  end

end
