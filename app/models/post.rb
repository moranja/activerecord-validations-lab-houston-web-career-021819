require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_sufficiently_clickbaity

  def is_sufficiently_clickbaity
    if title != nil
      if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
        errors.add(:title, 'Not clickbait-y enough!')
      end
    end
  end
end
