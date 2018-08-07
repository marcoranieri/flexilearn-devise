require 'test_helper'

class TutorssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutorss_index_url
    assert_response :success
  end

  test "should get show" do
    get tutorss_show_url
    assert_response :success
  end

  test "should get new" do
    get tutorss_new_url
    assert_response :success
  end

  test "should get create" do
    get tutorss_create_url
    assert_response :success
  end

  test "should get edit" do
    get tutorss_edit_url
    assert_response :success
  end

  test "should get update" do
    get tutorss_update_url
    assert_response :success
  end

  test "should get delete" do
    get tutorss_delete_url
    assert_response :success
  end

end
