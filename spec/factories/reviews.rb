FactoryGirl.define do
  factory :review do
    reviewer_name "MyString"
    star_ratings 1
    title "MyString"
    review_description "MyText"
    user nil
    book nil
  end
end
