class TransportImage < ActiveRecord::Base
  mount_uploader :path, FileUploader
  belongs_to :user
end
