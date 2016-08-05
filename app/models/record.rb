class Record < ActiveRecord::Base
  belongs_to :folder

  mount_uploader :attachment, FileUploader # Tells rails to use this uploader for this model.
  #validates :attachment, presence: true
  validates :folder_id, presence: true


  def url
    attachment.url
  end

  def path
    attachment.current_path
  end

  def name
    attachment_identifier
  end

  def size
    File.size(path)
  end

  def type
    File.ftype(path)
  end

end
