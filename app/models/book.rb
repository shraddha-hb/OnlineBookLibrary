class Book
  include Mongoid::Document
  # include Mongoid::Timestamps
  include Mongoid::Timestamps
  Mongoid::Attributes::Dynamic
  # Mongoid::MultiParameterAttributes
  field :name, type: String
  field :short_description, type: String
  field :long_description, type: String
  field :chapter_index, type: Integer
  field :published_date, type: DateTime
  field :genre, type: String
  belongs_to :user
  has_many :reviews
end
