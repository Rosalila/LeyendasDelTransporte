require 'test_helper'

class TransportCaptionsControllerTest < ActionController::TestCase
  setup do
    @transport_caption = transport_captions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transport_captions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transport_caption" do
    assert_difference('TransportCaption.count') do
      post :create, transport_caption: { caption: @transport_caption.caption }
    end

    assert_redirected_to transport_caption_path(assigns(:transport_caption))
  end

  test "should show transport_caption" do
    get :show, id: @transport_caption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transport_caption
    assert_response :success
  end

  test "should update transport_caption" do
    patch :update, id: @transport_caption, transport_caption: { caption: @transport_caption.caption }
    assert_redirected_to transport_caption_path(assigns(:transport_caption))
  end

  test "should destroy transport_caption" do
    assert_difference('TransportCaption.count', -1) do
      delete :destroy, id: @transport_caption
    end

    assert_redirected_to transport_captions_path
  end
end
