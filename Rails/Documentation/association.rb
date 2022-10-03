# command to open the rails console
rails c
# Create one-to-many relationships using the has_many and belongs_to Active Record macros
class Post < ApplicationRecord
    belongs_to :author
end
class Author < ApplicationRecord
    has_many :posts
  end
# Create one-to-one relationships using the has_one and belongs_to macros
# Create many-to-many relationships using a join table and has_many :through
class Post < ApplicationRecord
    belongs_to :author
    has_many :post_tags
    has_many :tags, through: :post_tags
  end
  
  class PostsTag < ApplicationRecord
    belongs_to :post
    belongs_to :tag
  end
  
  class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags
  end
# Conventionally, we label foreign keys in Active Record using the name of the model you're referencing, and _id eg author_id