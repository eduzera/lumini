require 'test_helper'

class ManufacturesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Manufacture.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Manufacture.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Manufacture.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to manufacture_url(assigns(:manufacture))
  end
  
  def test_edit
    get :edit, :id => Manufacture.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Manufacture.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Manufacture.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Manufacture.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Manufacture.first
    assert_redirected_to manufacture_url(assigns(:manufacture))
  end
  
  def test_destroy
    manufacture = Manufacture.first
    delete :destroy, :id => manufacture
    assert_redirected_to manufactures_url
    assert !Manufacture.exists?(manufacture.id)
  end
end
