class ProfileController < ApplicationController

	def index
		@profiles = Profile.all
		@users = User.all

	end

	def new
		@profile = current_user.profiles.build
	end

	def create
		@profile = current_user.profile.build(params[:name])
	end

	def show
	end


end
