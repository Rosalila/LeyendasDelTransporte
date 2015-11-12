class TransportCaption < ActiveRecord::Base
  has_many :image_in_captions
  has_many :transport_images, through: :image_in_captions
end
