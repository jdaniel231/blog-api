json.array! @comments do |comment|
  json.post_id comment.post_id
  json.id comment.id
  json.commit comment.commit
  json.created_at comment.created_at
  json.user do
    json.id comment.user.id
    json.email comment.user.email
    json.name comment.user.name
  end
end