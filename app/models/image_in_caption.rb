class ImageInCaption < ActiveRecord::Base
  belongs_to :transport_image
  belongs_to :transport_caption
end
