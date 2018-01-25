require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "MyString",
      :short_description => "MyText",
      :long_description => "MyText",
      :chapter_index => 1,
      :genre => "",
      :user => nil
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[name]"

      assert_select "textarea[name=?]", "book[short_description]"

      assert_select "textarea[name=?]", "book[long_description]"

      assert_select "input[name=?]", "book[chapter_index]"

      assert_select "input[name=?]", "book[genre]"

      assert_select "input[name=?]", "book[user_id]"
    end
  end
end
