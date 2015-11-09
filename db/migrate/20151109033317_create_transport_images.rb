class CreateTransportImages < ActiveRecord::Migration
  def change
    create_table :transport_images do |t|
      t.integer :user_id
      t.string :path

      t.timestamps null: false
    end
  end
end
