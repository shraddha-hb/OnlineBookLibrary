require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :name => "MyString",
      :short_description => "MyText",
      :long_description => "MyText",
      :chapter_index => 1,
      :genre => "",
      :user => nil
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[name]"

      assert_select "textarea[name=?]", "book[short_description]"

      assert_select "textarea[name=?]", "book[long_description]"

      assert_select "input[name=?]", "book[chapter_index]"

      assert_select "input[name=?]", "book[genre]"

      assert_select "input[name=?]", "book[user_id]"
    end
  end
end
