json.extract! user, :id, :name, :password, :email, :rank, :createdAt, :created_at, :updated_at
json.url user_url(user, format: :json)
