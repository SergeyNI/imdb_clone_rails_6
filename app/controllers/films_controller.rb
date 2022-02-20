class FilmsController < ApplicationController
  before_action :set_film
  
  # GET /films/1 
  def show
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Movie.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      # ApplicationController.index
      flash[:notice] = I18n.t "movies.error.not_found",id: params[:id]
      redirect_to root_path
    
    end
 

end
