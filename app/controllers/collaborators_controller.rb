class CollaboratorsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_wiki

  def new
    @collaborator = Collaborator.new
    @user = User.all
  end
  
  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
    if @collaborator.save
      flash[:notice] = "Your wiki was updated."
      redirect_to wiki_path(@wiki)
    else
      flash[:error] = "There was an error updating your wiki. Please try again."
      render :new
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Wiki was sucessfully updated."
      redirect_to wiki_path(@wiki)
    else
      flash[:error] = "There was an error. Please try again."
      render :show
    end
  end

private

  def set_wiki
    @wiki = Wiki.friendly.find(params[:wiki_id])
  end
end
