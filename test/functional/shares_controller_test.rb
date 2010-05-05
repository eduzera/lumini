require 'test_helper'

class SharesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Share.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Share.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Share.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to share_url(assigns(:share))
  end
  
  def test_edit
    get :edit, :id => Share.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Share.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Share.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Share.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Share.first
    assert_redirected_to share_url(assigns(:share))
  end
  
  def test_destroy
    share = Share.first
    delete :destroy, :id => share
    assert_redirected_to shares_url
    assert !Share.exists?(share.id)
  end
end
