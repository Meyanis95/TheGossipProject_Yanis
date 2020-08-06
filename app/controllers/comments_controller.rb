class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @comment = Comment.new(content: params[:content], user_id: 34, gossip_id: params[:gossip_id])
    puts "voici le params id: #{params}"
    if @comment.save
      redirect_to '/', notice: "Commetaire bien enregistré !"
    else
      redirect_to '/', notice: "Aie ton commentaire n'est pas valide"
    end
  end

  def new
  end 

  def destroy
    @comment = Comment.find_by(gossip: params[:id])
    @comment.destroy
    redirect_to gossips_path, notice: "Commentaire supprimé !"
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
