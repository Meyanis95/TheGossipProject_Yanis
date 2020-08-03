class AuthorController < ApplicationController
  def display_author
    @author_id = params[:author_id]
    
    @author_first_name = User.find_by(id: @author_id).first_name
    @author_last_name = User.find_by(id: @author_id).last_name
    @author_age = User.find_by(id: @author_id).age
    @author_city = User.find_by(id: @author_id).city.name
    @author_mail = User.find_by(id: @author_id).email
    @author_gossips = User.find_by(id: @author_id).gossips.all
  end
end
