class ArtWork < ActiveRecord::Base
  belongs_to :apply_record
  mount_uploader :image,ArtImageUploader
  paginates_per 10
end
