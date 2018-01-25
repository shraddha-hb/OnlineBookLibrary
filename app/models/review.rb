class Review
  include Mongoid::Document
  field :reviewer_name, type: String
  field :star_ratings, type: Integer
  field :title, type: String
  field :review_description, type: String
  # belongs_to :user
  belongs_to :book
end
