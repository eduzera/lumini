class Admin::PublisherController < ApplicationController
  
  access_control do
    allow logged_in, :to => [:index]
  end
  
end
