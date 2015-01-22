class ProfileController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]
	before_filter :authenticate_user!

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.balance = 1000
		respond_to do |format|
	      if @profile.save
	        format.html { redirect_to root_path, :notice => 'Zaktualizowano profil' }
	      else
	        format.html { render new_profile_path }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end		
	end

	def show

	end

	def edit

	end

	def update
	    respond_to do |format|
	      if @profile.update(profile_params)
	        format.html { redirect_to root_path, notice: 'Zaktualizowano profil' }
	        format.json { render :show, status: :ok, location: @profile }
	      else
	        format.html { render :edit }
	        format.json { render json: @product.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

		def set_profile
			@profile = Profile.find(params[:id])
		end

		def profile_params
			params.require(:profile).permit(:name, :surname, :street, :city, :homeNumber, :streetNumber,
      										:dateOfBirth, :user_id, :balance)
		end
end
