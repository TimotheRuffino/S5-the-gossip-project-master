class StaticController < ApplicationController
  def team 
  end

  def contact
  end

  def gossip
  end

  def welcome
      @user = params[:id]
  end

  def index
      @gossip = Gossip.all
  end 

  def show
    @gossip = Gossip.find(params[:id])
  end 

  def user
  end 

end 