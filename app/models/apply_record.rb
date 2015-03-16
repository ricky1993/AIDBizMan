class ApplyRecord < ActiveRecord::Base
  paginates_per 10
  has_many :art_works
  mount_uploader :image , ImageUploader
  mount_uploader :macroimage , MacroimageUploader
  mount_uploader :microimage , MicroimageUploader
  mount_uploader :qrimage , QrimageUploader
  mount_uploader :idimage,IdImageUploader
end
