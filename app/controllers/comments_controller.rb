class CommentsController <ApplicationController
	before_action :authenticate_login!, only: [:destroy, :new, :create, :edit]
	before_action :make_sure_its_mine, only:[:destroy, :edit]
	def show
		@comment=Comment.find(params[:id])
	end
    def new
		@comment=Comment.new
		# @post=Post.find(params[:id])
		@post_id=params[:post_id]
	end

	def create
		@comment=Comment.new comment_params
		if @comment.save
			redirect_to (Post.find(@comment.post_id)), notice: "Utworzono"
		else
			render 'new'
		end
	end
	def edit
		@comment = Comment.find params[:id]
	end

	def update
		@comment=Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to Post.find(@comment.post_id), notice: "Everything is fine!"
		else
			render 'edit'
		end	
	end 
	def destroy
		@comment=Comment.find(params[:id])
		@comment.destroy
		redirect_to Post.find(@comment.post_id), alert: "usunieto"
    end
	private
	def comment_params
		params.require(:comment).permit(:tresc, :login_id, :post_id)
	end
	private
		def make_sure_its_mine
			unless current_login.id==Comment.find(params[:id].to_i).login.id
				redirect_to root_url, alert: "To nie twoj post!"
			end
			true
		end	

end