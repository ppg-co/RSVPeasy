json.extract! event, :id, :name, :description, :picture, :created_at, :updated_at
json.url event_url(event, format: :json)
