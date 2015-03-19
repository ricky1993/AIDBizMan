class ArtWork < ActiveRecord::Base
  belongs_to :apply_record
  paginates_per 10
  mount_uploader :image,ArtImageUploader
  mount_uploader :macroimage , ArtMacroimageUploader
  mount_uploader :microimage_a , ArtMicroimageUploader
  mount_uploader :microimage_b , ArtMicroimageUploader
  mount_uploader :microimage_c , ArtMicroimageUploader
  mount_uploader :microimage_d , ArtMicroimageUploader
  mount_uploader :qrimage , ArtQrimageUploader
end
