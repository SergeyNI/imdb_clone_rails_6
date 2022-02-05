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

  # def films
  #   render partial: 'film', collection: movies
  # end

  # def count_films
  #   render json: movies_by_category.count
  # end

  def film
    
  end

  
  private
  def set_film
    @film = Movie.friendly.find(params[:id])
    
  end
  
  # def movies
  #   movies_by_category.page(params[:page])
  # end
  # def movies_by_category
  #   if params[:category_id].to_i.zero?
  #     @movies = Movie.all
  #   else
  #     @movies = Movie.where(category_id: params[:category_id])
  #   end
  #   @movies
  # end

end
