require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category=Category.create(name: "Sports")
    @category2=Category.create(name: "Travel")
  
    test "should show categories listing" do
      get '/categories'
      asser_select "a[href=?]", category_path(@category), text:@category.name
      asser_select "a[href=?]", category_path(@category2), text: @category2.name
    end
  end
end
