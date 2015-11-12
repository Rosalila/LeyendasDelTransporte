json.array!(@image_in_captions) do |image_in_caption|
  json.extract! image_in_caption, :id, :transport_image_id, :transport_caption_id
  json.url image_in_caption_url(image_in_caption, format: :json)
end
