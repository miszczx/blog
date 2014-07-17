class UsersController <ApplicationController
	def index
		@user= User.all
	end

	def show
		@user= User.find(params[:id])
	end
	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to root_url, alert: "usunieto"
	end

	def new
		@user=User.new
	end

	def create
		@user=User.new user_params

		if @user.save
			redirect_to root_url, notice: "Utworzono"
		else
			render 'new'
		end
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to root_url, notice: "Everything is fine!"
		else
			render 'edit'
		end
	end 

	private
	def user_params
		params.require(:user).permit(:name, :age)
	end
end
#http://stackoverflow.com/questions/19373229/rails-4-unknown-action-the-action-destroy-could-not-be-found-for-postscontro
