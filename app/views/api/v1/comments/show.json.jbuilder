json.id @comment.id
json.post_id @comment.post_id
json.commit @comment.commit
json.created_at @comment.created_at

json.user do
  json.id @comment.user.id
  json.email @comment.user.email
  json.name @comment.user.name
end
