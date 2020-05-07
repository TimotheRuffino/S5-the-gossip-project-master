class WelcomeController < ApplicationController

def index
end

def welcome
  @user = params[:id]
end

end