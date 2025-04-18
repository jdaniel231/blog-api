json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.description post.description
  json.user do
    json.id post.user.id
    json.email post.user.email
  end
  json.created_at post.created_at
  json.updated_at post.updated_at
end
