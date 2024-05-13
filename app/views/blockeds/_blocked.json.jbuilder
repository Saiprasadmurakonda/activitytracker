json.extract! blocked, :id, :blocked_site, :created_at, :updated_at
json.url blocked_url(blocked, format: :json)
