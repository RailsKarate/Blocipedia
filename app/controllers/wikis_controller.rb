class WikisController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
 
 def index
    @wikis = Kaminari.paginate_array(policy_scope(Wiki)).page(params[:page])
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    @collaborators = @wiki.users
  end

  def list
    @wikis = current_user.wikis
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.create(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error creating your wiki."
      render :new 
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was successfully updated." 
      redirect_to @wiki
    else
      flash[:error] = "There was an error editing the post. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "Successfully deleted your Wiki."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting your Wiki. Please try again."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :isprivate)
  end
end
