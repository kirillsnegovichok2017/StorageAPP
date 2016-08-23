module StaticPagesHelper
  include ActionView::Helpers::AssetUrlHelper # for asset_path
  require 'json'

  def images_path(img_dir='')
      # path = Rails.root.join('app', 'assets', 'images')
      # Dir.chdir(path.to_s)
      # (img_dir.empty?) ? Dir.glob("*.{png,jpg}").map { |img| asset_path img} : Dir.glob( img_dir + "/" +"*.{png,jpg}").map { |img| asset_path img}
      ' '
  end
end
