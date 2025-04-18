# new.json.jbuilder / edit.json.jbuilder
json.id @post.id if @post.persisted?
json.title @post.title
json.description @post.description
