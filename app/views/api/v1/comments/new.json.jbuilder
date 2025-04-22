json.comment do 
  json.commit nil
  json.post_id @comment.post_id
  json_user_id @comment.user_id
end