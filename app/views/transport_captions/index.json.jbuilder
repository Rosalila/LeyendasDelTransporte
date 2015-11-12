json.array!(@transport_captions) do |transport_caption|
  json.extract! transport_caption, :id, :caption
  json.url transport_caption_url(transport_caption, format: :json)
end
