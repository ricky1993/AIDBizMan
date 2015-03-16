require 'test_helper'

class ApplyRecordsControllerTest < ActionController::TestCase
  setup do
    @apply_record = apply_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apply_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apply_record" do
    assert_difference('ApplyRecord.count') do
      post :create, apply_record: { artcategory: @apply_record.artcategory, item: @apply_record.item, organization: @apply_record.organization, personcategory: @apply_record.personcategory, state: @apply_record.state, timelimit: @apply_record.timelimit }
    end

    assert_redirected_to apply_record_path(assigns(:apply_record))
  end

  test "should show apply_record" do
    get :show, id: @apply_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apply_record
    assert_response :success
  end

  test "should update apply_record" do
    patch :update, id: @apply_record, apply_record: { artcategory: @apply_record.artcategory, item: @apply_record.item, organization: @apply_record.organization, personcategory: @apply_record.personcategory, state: @apply_record.state, timelimit: @apply_record.timelimit }
    assert_redirected_to apply_record_path(assigns(:apply_record))
  end

  test "should destroy apply_record" do
    assert_difference('ApplyRecord.count', -1) do
      delete :destroy, id: @apply_record
    end

    assert_redirected_to apply_records_path
  end
end
