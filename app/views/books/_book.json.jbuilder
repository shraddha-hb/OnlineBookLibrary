json.extract! book, :id, :name, :short_description, :long_description, :chapter_index, :published_date, :genre, :user_id, :created_at, :updated_at
json.url book_url(book, format: :json)
