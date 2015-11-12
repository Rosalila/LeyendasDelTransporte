class CreateTransportCaptions < ActiveRecord::Migration
  def change
    create_table :transport_captions do |t|
      t.string :caption

      t.timestamps null: false
    end
  end
end
