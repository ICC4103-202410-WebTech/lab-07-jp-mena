class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id'


    validates :title, presence: { message: "Title can't be blank." }
    validates :content, presence: { message: "Content can't be blank." }
    validates :user_id, presence: { message: "User ID can't be blank." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count must be a non-negative number." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count must be a non-negative number." }
  
    before_validation :set_default_published_at, if: -> { published_at.nil? }

  private
    def set_default_published_at
        self.published_at = Time.current
    end
end