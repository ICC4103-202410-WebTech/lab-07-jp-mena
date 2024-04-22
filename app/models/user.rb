class User < ApplicationRecord
    has_many :posts



    validates :name, presence: { message: "Please provide your name." }
    validates :email, presence: { message: "Please provide your email address." },
                    uniqueness: { message: "This email address is already taken." },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Please provide a valid email address." }
    validates :password, presence: { message: "Please provide a password." },
                       length: { minimum: 6, message: "Your password must be at least 6 characters long." }

end