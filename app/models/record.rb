class Record < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  belongs_to :folder


  mount_uploader :attachment, FileUploader # Tells rails to use this uploader for this model.
  #validates :attachment, presence: true
  validates :folder_id, presence: true


  def url
    attachment.url
  end

  def path
    #attachment.current_path
    parent = folder
    _path = parent.name
    while not parent.root?
      _path = "#{parent.name}/" + _path
      parent = parent.folder
    end
    _path = "#{parent.user.name}/" + _path
    _path
  end

  def name
    attachment_identifier
  end

  def size
    number_to_human_size(File.size(path))
  end

  def type
    File.ftype(path)
  end

  def owner
    folder.user.name
  end

end
