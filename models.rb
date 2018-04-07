class User < ActiveRecord::Base
has_many :Blogs
end

class Blog < ActiveRecord::Base
belongs_to :User
end