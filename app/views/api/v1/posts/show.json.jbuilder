json.id @post.id
json.title @post.title
json.description @post.description
json.created_at @post.created_at
json.user do
  json.id @post.user.id
  json.email @post.user.email
  json.name @post.user.name
end