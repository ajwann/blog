class Post < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 5 }

  def raw_text
  end

  def raw_title
  end
end
