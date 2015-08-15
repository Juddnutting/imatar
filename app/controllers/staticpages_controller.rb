class StaticpagesController < ApplicationController

	def index
		@user = User.search(params[:search])
		if @user.nil?
			flash[:success] = "No record found"
		end
		#@profile = @user.profile
	end

end
