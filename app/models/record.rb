class Record < ActiveRecord::Base
  mount_uploader :file, FileUploader # Tells rails to use this uploader for this model
  validates :name, presence: true # Make sure the name of Record is present.
end
