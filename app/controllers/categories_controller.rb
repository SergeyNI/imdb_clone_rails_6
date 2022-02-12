class CategoriesController < InheritedResources::Base
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_admin_user!
  def index
    @categories = Category.all
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @category = Category.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @category = Category.new(category_params)
    
    # binding.pry
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

   # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @category.update(movie_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private

    def category_params
      # params.require(:category).permit()
      params.require(:category).permit(:name)
    end
    def set_category
      @category = Category.friendly.find(params[:id])
    end

end
