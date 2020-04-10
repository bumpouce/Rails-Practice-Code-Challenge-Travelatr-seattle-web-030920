class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than_or_equal_to: 0}
    validates :bio, length: {minimum: 30}


    def total_likes_count
        self.posts.map {|post| post.likes}.sum
    end

    def featured_post
        self.posts.max_by {|post| post.likes}
    end

    def top_destinations
       this = []
       top = []
       this = self.destinations.max_by(5) {|destination| destination.posts.count}.uniq
       this.each do |destination|
           top << Post.find_by(destination_id: destination.id)
       end
       top
    end

end
