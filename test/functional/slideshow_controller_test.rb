require 'test_helper'

class SlideshowControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Slideshow.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Slideshow.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Slideshow.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to slideshow_url(assigns(:slideshow))
  end
  
  def test_edit
    get :edit, :id => Slideshow.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Slideshow.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Slideshow.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Slideshow.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Slideshow.first
    assert_redirected_to slideshow_url(assigns(:slideshow))
  end
  
  def test_destroy
    slideshow = Slideshow.first
    delete :destroy, :id => slideshow
    assert_redirected_to slideshow_url
    assert !Slideshow.exists?(slideshow.id)
  end
end
