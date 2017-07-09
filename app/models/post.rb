class Post < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }
end
