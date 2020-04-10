class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :content, length: {minimum: 100}

    def add_like
        update_likes = self.likes + 1
        self.update(likes: update_likes)
    end
end
