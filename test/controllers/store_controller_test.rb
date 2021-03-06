require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get :index
      assert_response :success
      assert_select '#columns #side a', minimum: 4
      assert_select '#main .entry', 3
      assert_select 'h3', 'Programming Ruby 1.9'
      assert_select '.price', /\$[,\d]+\.\d\d/
    # (#columns) - це селектор якщщо починаються з # -відповідає атрибутам id
    # p rhfgrb(.) відповідає атрибутам class, без префікса відповідають нозвам елементів
    # get store_index_url
    # assert_response :success
  end

end
