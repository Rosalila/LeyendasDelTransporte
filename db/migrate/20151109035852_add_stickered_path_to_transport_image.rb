class AddStickeredPathToTransportImage < ActiveRecord::Migration
  def change
    add_column :transport_images, :stickered_path, :string
  end
end
