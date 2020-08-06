class GossipsController < ApplicationController
  before_action :authenticate_user#, only: [:index]

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title],content: params[:content])
    @gossip.user = current_user

    if @gossip.save
      redirect_to '/', notice: "Potin bien enregistré !"
    else
      redirect_to '/gossips/new', notice: "Aie ton potin n'est pas valide"
    end
  end

  def show
    puts "voici les params de ma méthide show gossip #{params}"
    @id = params[:id]
    @gossip = Gossip.find_by(id: @id)
    @gossip_title = Gossip.find_by(id: @id).title.capitalize
    @gossip_content = Gossip.find_by(id: @id).content
    @gossip_date = Gossip.find_by(id: @id).created_at

    @user_first_name = User.find_by(id: @gossip.user_id).first_name
    @user_last_name = User.find_by(id: @gossip.user_id).last_name
    @user_age = User.find_by(id: @gossip.user_id).age
    @user_city = User.find_by(id: @gossip.user_id).city.name
    @user_id = @gossip.user_id
  end

  def edit 
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update
    @gossip = Gossip.find_by(id: params[:id])
    post_params = params.require(:gossip).permit(:title,:content)
    if @gossip.update(post_params)
      redirect_to gossips_path, notice: "Potin modifié !"
    else
      redirect_to edit_gossip_path, notice: "Aie ta modification n'est pas valide"
    end
  end 

  def index
    redirect_to '/'
  end

  def destroy 
    @gossip = Gossip.find_by(id: params[:id])
    @gossip.destroy
    redirect_to gossips_path, notice: "Potin supprimé !"
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
