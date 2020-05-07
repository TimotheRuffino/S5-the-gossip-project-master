class SessionsController < ApplicationController

  #skip_before_action :only_signed_in, only: [:new, :create]

  def new #correspond à la page de login
  end

  def create
    user_params = params.require(:user)
    @user = User.where(email: user_params[:email]).first
    if @user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to gossips_path, success: 'Connexion réussie'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to new_session_path

    end
  end

  #def create

   # id = session[:user_id]
    #@user = User.find(id) #et hop, cette variable @user est l'instance User contenant toutes les infos de l'utilisateur connecté
  
    # cherche s'il existe un utilisateur en base avec l’e-mail
  #user = User.find_by(email: email_dans_ton_params)

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  #if user && user.authenticate(password_dans_ton_params)
   # session[:user_id] = user.id
    # redirige où tu veux, avec un flash ou pas

  #else
   # flash.now[:danger] = 'Invalid email/password combination'
    #render 'new'
  #end
#end

  def destroy #logout
  end

end
