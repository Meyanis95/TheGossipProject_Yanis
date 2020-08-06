class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
    @user = params[:first_name]
  end 

  def index
    @gossip = Gossip.all
  end

  def show_gossip
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
end
