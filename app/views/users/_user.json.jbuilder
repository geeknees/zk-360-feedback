json.extract! user, :id, :name, :email, :hashed_id, :role, :organization_id, :created_at, :updated_at
json.url user_url(user, format: :json)
