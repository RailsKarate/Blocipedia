class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
    
  end

  def list
    @wikis = current_user.wikis
  end
  # GET /wikis/1
  # GET /wikis/1.json
  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    
    if @wiki.save
      flash[:notice] = "Wiki article was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    @wiki = Wiki.find(params[:id])
    
    if @wiki.update_attributes(wiki_params)
     flash[:notice] = "Wiki article was updated."
     redirect_to @wiki
    else
     flash[:error] = "There was an error saving the wiki. Please try again."
     render :edit
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
   @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.destroy
     flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
     redirect_to @wiki
    else
     flash[:error] = "There was an error deleting the wiki."
     render :show
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
end
