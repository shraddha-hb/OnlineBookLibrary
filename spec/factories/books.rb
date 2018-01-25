FactoryGirl.define do
  factory :book do
    name "MyString"
    short_description "MyText"
    long_description "MyText"
    chapter_index 1
    published_date "2018-01-24 13:01:35"
    genre ""
    user nil
  end
end
