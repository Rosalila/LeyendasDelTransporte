class CreateImageInCaptions < ActiveRecord::Migration
  def change
    create_table :image_in_captions do |t|
      t.integer :transport_image_id
      t.integer :transport_caption_id

      t.timestamps null: false
    end
  end
end
