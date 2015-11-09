json.array!(@transport_images) do |transport_image|
  json.extract! transport_image, :id, :user_id, :path
  json.url transport_image_url(transport_image, format: :json)
end
