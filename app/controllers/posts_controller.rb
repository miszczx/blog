class PostsController <ApplicationController
	before_action :authenticate_login!, only: [:destroy, :new, :create, :edit]
	before_action :make_sure_its_mine, only:[:destroy, :edit]
	def index
		@post= Post.all
	end

	def show
		@post= Post.find(params[:id])
	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to root_url, alert: "usunieto"
    end

    def new
		@post=Post.new
	end

	def create
		@post=Post.new post_params

		if @post.save
			redirect_to root_url, notice: "Utworzono"
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find params[:id]
	end

	def update
		@post=Post.find(params[:id])
		if @post.update(post_params)
			redirect_to root_url, notice: "Everything is fine!"
		else
			render 'edit'
		end	
	end 

	private
	def post_params
		params.require(:post).permit(:tresc, :autor, :login_id)
	end
	private
		def make_sure_its_mine
			unless current_login.id==Post.find(params[:id].to_i).login.id
				redirect_to root_url, alert: "To nie twoj post!"
			end
			true
		end	
end
