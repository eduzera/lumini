class Admin::SolutionsController < ApplicationController
  
  layout "publisher_solutions"
  
  before_filter :put_last_controller_on_session
  
  def index
    
  end

  def new
    @solution = Solution.new
    @solution.lang_solution.build
  end

  def create
    @solution = Solution.new(params[:solution])
    if @solution.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_solution_url(@solution)
    else
      redirect_to :back
    end
  end

  def edit
    @solution = Solution.find(params[:id])
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update_attributes(params[:solution])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_solution_path(@solution)
    else
      redirect_to :back
    end
  end

  def show
    @solution = Solution.find(params[:id])
  end

  def destroy
    @solution = Solution.find(params[:id])
    
    @solution.destroy
    
    redirect_to admin_solutions_path
  end
  
  def add_new_language
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_solution => LangSolution.new }}
    end
  end
  
  def put_last_controller_on_session 
        session[:last_controller] = self.controller_name
  end

end
