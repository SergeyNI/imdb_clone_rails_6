class HomeController < ApplicationController
  before_action :set_film, only: %i[ film ]
  
  def index
    @categories = Category.all
        
    @movies = Movie.page(params[:page])
    @category = Category.new
    if params[:category_id]
      @category = Category.friendly.find params[:category_id]
      @movies = @movies.where(category_id: @category.id) 
    end    
  end
  
  def film
  end
 
  private
  def set_film
    @film = Movie.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # ApplicationController.index
    flash[:notice] = "film #{params[:id]} not found"
    redirect_to action: 'index'
  end
  

end
