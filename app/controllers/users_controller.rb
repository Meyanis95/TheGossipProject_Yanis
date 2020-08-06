require 'bcrypt'
class UsersController < ApplicationController
  def create
      @user = User.new(first_name: params[:first_name],last_name: params[:last_name], age: params[:age], description: params[:description], email: params[:email],city_id:26, password: params[:password],password_confirmation: params[:password_confirmation])
      puts "voici mes params : #{@user}"
      if @user.save
        redirect_to '/', notice: "Tu es bien inscris !"
      else
        redirect_to '/', notice: "Aie ton inscription n'est pas valide"
      end
  end

  def new
  end
end
