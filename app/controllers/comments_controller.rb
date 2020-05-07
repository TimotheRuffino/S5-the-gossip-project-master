class CommentsController < ApplicationController
  def new
    @comment = Comment.new(gossip: "Gossip", user: User.last, content: "Contenu")
  end

  # Create a new comment
  def create
    gossip = Gossip.find(params[:gossip])

    comment = Comment.new(gossip: gossip,
                          user: User.last,
                          content: params[:content])

    if comment.save
      flash[:success] = "Le potin a été créé avec succès."
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    else
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

	def index
		@comment = Comment.all
	end


def update
	@comment = Comment.find(params[:id])
	if @comment.update(comment_params)
		flash[:success] = "Ton super potin a correctement été mis à jour !"
		redirect_to gossips_path(@comment.gossip.id)
	else
		render 'edit'
	end
end

	def edit
		@comment = Comment.find(params[:id])
	end

	

def destroy
	@comment = Comment.find(params[:id])
	if @comment.destroy
		redirect_to gossips_path(@comment.gossip.id)
	else 
		render 'edit'
	end
end

end

private
	
def comment_params
  params.require(:comment).permit(:content, :gossip)
end


