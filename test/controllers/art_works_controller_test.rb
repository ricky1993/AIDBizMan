require 'test_helper'

class ArtWorksControllerTest < ActionController::TestCase
  setup do
    @art_work = art_works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:art_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create art_work" do
    assert_difference('ArtWork.count') do
      post :create, art_work: { apply_record: @art_work.apply_record, author: @art_work.author, date: @art_work.date, describe: @art_work.describe, image: @art_work.image, name: @art_work.name, place: @art_work.place }
    end

    assert_redirected_to art_work_path(assigns(:art_work))
  end

  test "should show art_work" do
    get :show, id: @art_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @art_work
    assert_response :success
  end

  test "should update art_work" do
    patch :update, id: @art_work, art_work: { apply_record: @art_work.apply_record, author: @art_work.author, date: @art_work.date, describe: @art_work.describe, image: @art_work.image, name: @art_work.name, place: @art_work.place }
    assert_redirected_to art_work_path(assigns(:art_work))
  end

  test "should destroy art_work" do
    assert_difference('ArtWork.count', -1) do
      delete :destroy, id: @art_work
    end

    assert_redirected_to art_works_path
  end
end
