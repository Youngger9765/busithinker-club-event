require 'test_helper'

class Admin::ClubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_club = admin_clubs(:one)
  end

  test "should get index" do
    get admin_clubs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_club_url
    assert_response :success
  end

  test "should create admin_club" do
    assert_difference('Admin::Club.count') do
      post admin_clubs_url, params: { admin_club: {  } }
    end

    assert_redirected_to admin_club_url(Admin::Club.last)
  end

  test "should show admin_club" do
    get admin_club_url(@admin_club)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_club_url(@admin_club)
    assert_response :success
  end

  test "should update admin_club" do
    patch admin_club_url(@admin_club), params: { admin_club: {  } }
    assert_redirected_to admin_club_url(@admin_club)
  end

  test "should destroy admin_club" do
    assert_difference('Admin::Club.count', -1) do
      delete admin_club_url(@admin_club)
    end

    assert_redirected_to admin_clubs_url
  end
end
