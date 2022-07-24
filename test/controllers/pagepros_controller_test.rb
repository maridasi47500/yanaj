require 'test_helper'

class PageprosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pagepros_show_url
    assert_response :success
  end

end
