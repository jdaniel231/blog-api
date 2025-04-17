class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :created_at
  
  belongs_to :user, serializer: UserSerializer
end
