require 'test_helper'

class PdfFilesControllerTest < ActionController::TestCase
  setup do
    @pdf_file = pdf_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdf_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf_file" do
    assert_difference('PdfFile.count') do
      post :create, :pdf_file => @pdf_file.attributes
    end

    assert_redirected_to pdf_file_path(assigns(:pdf_file))
  end

  test "should show pdf_file" do
    get :show, :id => @pdf_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pdf_file.to_param
    assert_response :success
  end

  test "should update pdf_file" do
    put :update, :id => @pdf_file.to_param, :pdf_file => @pdf_file.attributes
    assert_redirected_to pdf_file_path(assigns(:pdf_file))
  end

  test "should destroy pdf_file" do
    assert_difference('PdfFile.count', -1) do
      delete :destroy, :id => @pdf_file.to_param
    end

    assert_redirected_to pdf_files_path
  end
end
