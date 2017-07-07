class UsersController < ApplicationController

	def sign_up
		@user = User.new
	end

	def show
		@user = User.find_by(id: params[:id])
		@current_user = current_user() 
	end

	def create
		@user = User.new(user_params)

		if @user.save

			#ExampleMailer.sample_email(@user).deliver
			session[:user_id] = @user.id
			redirect_to root_path
		else
			render :sign_up
		end
	end

	def update

		@user = current_user
		if @user

			if params[:images].present?
				params[:images].each do |image|
					@user.images.create(img: image, post_id: Post.last.id)
				end
			end
			#ExampleMailer.sample_email(@user).deliver
			redirect_to posts_path
		else
			redirect_to posts_path
		end
	end

	def sign_in
	end

	def add_image

	end

	private
	def current_user
		if session[:user_id]
			User.find_by(id: session[:user_id])
		else
			nil
		end
	end
	def user_params
		params.require(:user).permit(:user_image,:first_name, :last_name, :email, :password)
	end
end
