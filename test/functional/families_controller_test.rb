require 'test_helper'

class FamiliesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Family.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Family.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Family.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to family_url(assigns(:family))
  end
  
  def test_edit
    get :edit, :id => Family.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Family.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Family.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Family.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Family.first
    assert_redirected_to family_url(assigns(:family))
  end
  
  def test_destroy
    family = Family.first
    delete :destroy, :id => family
    assert_redirected_to families_url
    assert !Family.exists?(family.id)
  end
end
