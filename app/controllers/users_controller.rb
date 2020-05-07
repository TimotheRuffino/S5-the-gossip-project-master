class UsersController < ApplicationController

  def show
  end

  def user
  end 

def index
end

def create
  if params[:password] == params[:password_confirmation]
    @user = User.new( 'first_name' => params[:first_name],
                      'last_name' => params[:last_name],
                      'age' => params[:age],
                      'city_id' => City.all.sample.id , 
                      'email' => params[:email],
                      'password' => params[:password_digest]
                      )
                    
      if @user.valid? # essaie de sauvegarder en base @user
        flash.notice = "User successfully created"
        redirect_to root_path
      else
        flash.alert = "User can not be registred"
        render 'new'
        flash.alert = nil
      end
    end
end

  def new
      @user = User.new
  end

end

private
	
def user_params
  params.require(:user).permit(:email, :password_digest, :first_name, :last_name, :age, :city_id)
end