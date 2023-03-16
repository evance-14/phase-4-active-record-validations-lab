class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :title_is_clickbait


    def title_is_clickbait
        if !title || (!title.include?("Won't Believe") && !title.include?("Secret") && !title.match?(/Top \d+/) && !title.include?("Guess"))
          errors.add(:title, "is not sufficiently clickbait-y")
        end
      end
end
