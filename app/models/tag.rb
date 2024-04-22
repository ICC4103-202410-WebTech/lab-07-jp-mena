class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags


    validates :name, presence: { message: "Tag name can't be blank." },
                   uniqueness: { message: "This tag name is already taken." }
  end
  