class UsersController < ApplicationController

  def show
  end

def create
  
    @user = User.new( 'first_name' => params[:first_name],
                      'last_name' => params[:last_name],
                      'age' => params[:age],
                      #'city_id' => City.all.sample.id , 
                      'email' => params[:email],
                      'password' => params[:password]
                      )
                    
      if @user.save # essaie de sauvegarder en base @user
        flash.notice = "User successfully created"
        redirect_to gossips_path
      else
        flash.alert = "User can not be registred"
        redirect_to new_user_path
        flash.alert = nil
      end
    
end

  def new
      @user = User.new
  end

#def user_params
 # params.require(:user).permit(:email, :age, :password, :first_name, :last_name, :city_id)
#end

end


	
