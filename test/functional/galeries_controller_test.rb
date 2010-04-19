require 'test_helper'

class GaleriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Galery.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Galery.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Galery.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to galery_url(assigns(:galery))
  end
  
  def test_edit
    get :edit, :id => Galery.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Galery.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Galery.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Galery.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Galery.first
    assert_redirected_to galery_url(assigns(:galery))
  end
  
  def test_destroy
    galery = Galery.first
    delete :destroy, :id => galery
    assert_redirected_to galeries_url
    assert !Galery.exists?(galery.id)
  end
end
