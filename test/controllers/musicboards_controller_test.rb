require 'test_helper'

class MusicboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get musicboards_index_url
    assert_response :success
  end

  test "should get new" do
    get musicboards_new_url
    assert_response :success
  end

  test "should get show" do
    get musicboards_show_url
    assert_response :success
  end

end
