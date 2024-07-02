json.extract! element, :id, :element_type, :content, :created_at, :updated_at
json.url element_url(element, format: :json)
json.content element.content.to_s
