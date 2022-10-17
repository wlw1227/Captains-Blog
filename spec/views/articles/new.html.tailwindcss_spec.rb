require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      stardate: "MyString",
      body: "MyText"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[stardate]"

      assert_select "textarea[name=?]", "article[body]"
    end
  end
end
