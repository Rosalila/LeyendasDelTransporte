class TransportImage < ActiveRecord::Base
  mount_uploader :path, FileUploader
  belongs_to :user
  has_many :image_in_captions
  has_many :transport_captions, through: :image_in_captions
end
