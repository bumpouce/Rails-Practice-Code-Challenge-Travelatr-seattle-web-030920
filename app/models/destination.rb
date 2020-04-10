class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def average_blogger_age
        if self.bloggers.count >= 0
            @average = (self.bloggers.map {|blogger| blogger.age}.sum) / self.bloggers.count
        else 
            @average = "[no data yet]"
        end
        @average
    end

    def recent_posts
        self.posts.sort_by {|post| post.created_at}.first(5)
    end

    def featured_post
        self.posts.max_by {|post| post.likes}
    end
end
