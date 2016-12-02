require 'test_helper'

class FormAttachmentsControllerTest < ActionController::TestCase
  setup do
    @form_attachment = form_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_attachment" do
    assert_difference('FormAttachment.count') do
      post :create, form_attachment: { file: @form_attachment.file, form_id: @form_attachment.form_id }
    end

    assert_redirected_to form_attachment_path(assigns(:form_attachment))
  end

  test "should show form_attachment" do
    get :show, id: @form_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_attachment
    assert_response :success
  end

  test "should update form_attachment" do
    patch :update, id: @form_attachment, form_attachment: { file: @form_attachment.file, form_id: @form_attachment.form_id }
    assert_redirected_to form_attachment_path(assigns(:form_attachment))
  end

  test "should destroy form_attachment" do
    assert_difference('FormAttachment.count', -1) do
      delete :destroy, id: @form_attachment
    end

    assert_redirected_to form_attachments_path
  end
end
