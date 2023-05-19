class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :sufficiently_clickbait_title

  def sufficiently_clickbait_title
    unless title&.match?(/Won't Believe|Secret|Top \d+|Guess/)
      errors.add(:title, "should be sufficiently clickbait-y")
    end
  end
  end
  