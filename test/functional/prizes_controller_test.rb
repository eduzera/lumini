require 'test_helper'

class PrizesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Prize.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Prize.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Prize.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to prize_url(assigns(:prize))
  end
  
  def test_edit
    get :edit, :id => Prize.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Prize.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Prize.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Prize.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Prize.first
    assert_redirected_to prize_url(assigns(:prize))
  end
  
  def test_destroy
    prize = Prize.first
    delete :destroy, :id => prize
    assert_redirected_to prizes_url
    assert !Prize.exists?(prize.id)
  end
end
