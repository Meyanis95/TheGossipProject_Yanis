class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login(user)
      remember(user)
      # redirige où tu veux, avec un flash ou pas
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out(current_user)
    redirect_to '/'
  end
end
