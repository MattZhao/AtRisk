require 'test_helper'

class TestAttachmentsControllerTest < ActionController::TestCase
  setup do
    @test_attachment = test_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_attachment" do
    assert_difference('TestAttachment.count') do
      post :create, test_attachment: { attachment: @test_attachment.attachment }
    end

    assert_redirected_to test_attachment_path(assigns(:test_attachment))
  end

  test "should show test_attachment" do
    get :show, id: @test_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_attachment
    assert_response :success
  end

  test "should update test_attachment" do
    patch :update, id: @test_attachment, test_attachment: { attachment: @test_attachment.attachment }
    assert_redirected_to test_attachment_path(assigns(:test_attachment))
  end

  test "should destroy test_attachment" do
    assert_difference('TestAttachment.count', -1) do
      delete :destroy, id: @test_attachment
    end

    assert_redirected_to test_attachments_path
  end
end
