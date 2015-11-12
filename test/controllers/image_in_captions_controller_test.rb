require 'test_helper'

class ImageInCaptionsControllerTest < ActionController::TestCase
  setup do
    @image_in_caption = image_in_captions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_in_captions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_in_caption" do
    assert_difference('ImageInCaption.count') do
      post :create, image_in_caption: { transport_caption_id: @image_in_caption.transport_caption_id, transport_image_id: @image_in_caption.transport_image_id }
    end

    assert_redirected_to image_in_caption_path(assigns(:image_in_caption))
  end

  test "should show image_in_caption" do
    get :show, id: @image_in_caption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_in_caption
    assert_response :success
  end

  test "should update image_in_caption" do
    patch :update, id: @image_in_caption, image_in_caption: { transport_caption_id: @image_in_caption.transport_caption_id, transport_image_id: @image_in_caption.transport_image_id }
    assert_redirected_to image_in_caption_path(assigns(:image_in_caption))
  end

  test "should destroy image_in_caption" do
    assert_difference('ImageInCaption.count', -1) do
      delete :destroy, id: @image_in_caption
    end

    assert_redirected_to image_in_captions_path
  end
end
