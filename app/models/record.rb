class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder

  mount_uploader :attachment, FileUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  validates :user_id, presence: true
end
