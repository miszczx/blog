class LoginsController < ApplicationController
	before_action :authenticate_login!
	before_action :make_sure_its_mine, only:[:show]
	before_action :make_sure_its_host, only:[:index]

	def show
		@login=current_login
	end

	def index
		@login=Login.all
	end

	private
		def make_sure_its_mine
			unless current_login.id==params[:id].to_i
				redirect_to root_url, alert: "To nie twoje konto"
			end
			true
		end
	private
		def make_sure_its_host
			unless current_login.id==1
				redirect_to root_url, alert: "nie jestes hostem!"
			end
			true
		end
end