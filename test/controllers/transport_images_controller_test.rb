require 'test_helper'

class TransportImagesControllerTest < ActionController::TestCase
  setup do
    @transport_image = transport_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_image" do
    assert_difference('TransportImage.count') do
      post :create, transport_image: { path: @transport_image.path, user_id: @transport_image.user_id }
    end

    assert_redirected_to transport_image_path(assigns(:transport_image))
  end

  test "should show transport_image" do
    get :show, id: @transport_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_image
    assert_response :success
  end

  test "should update transport_image" do
    patch :update, id: @transport_image, transport_image: { path: @transport_image.path, user_id: @transport_image.user_id }
    assert_redirected_to transport_image_path(assigns(:transport_image))
  end

  test "should destroy transport_image" do
    assert_difference('TransportImage.count', -1) do
      delete :destroy, id: @transport_image
    end

    assert_redirected_to transport_images_path
  end
end
