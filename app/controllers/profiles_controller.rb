class ProfilesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show, :send_image]

	def index
		@user = User.search(params[:search])
	end

	def new
		@profile = current_user.build_profile
	end

	def create
		@profile = current_user.build_profile(profile_params)
		if @profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

	def show
		@profile = current_user.profile
	end

	def send_image
		@profile = Profile.find_by(email_hash: params[:email_hash])
		render :layout => false
	end

	def search
		@user = User.find_by(email: params[:email].strip.downcase)
	end

	private

		def profile_params
			params.require(:profile).permit(:image)
		end

		


end
