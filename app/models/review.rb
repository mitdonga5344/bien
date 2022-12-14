class Review < ApplicationRecord
   has_many :comments, dependent: :destroy
   belongs_to :user
   has_many :bookmarks

   geocoded_by :address
   after_validation :geocode

   mount_uploader :review_image, ReviewImageUploader

   validates :title, presence: true, length: { minimum: 10 }
   validates :body, presence: true, length: { minimum: 20 }
   validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
   validates :restaurant, presence: true, length: { minimum: 4}
   validates :address, presence: true

   def to_param
      id.to_s + "-" + title.parameterize
   end

end
