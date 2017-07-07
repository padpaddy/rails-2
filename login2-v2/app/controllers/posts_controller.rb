class PostsController < ApplicationController
	def index
		@posts = Post.all.order(:created_at).reverse
		@post = Post.new
		@current_user = current_user()

	end
	def show
		@post = Post.find(params[:id])
	end
	
	def create
		@post = current_user.posts.new(content: params[:post][:content])
		if @post.save
			#ExampleMailer.sample_email(@user).deliver
			if params[:images].present?
				params[:images].each do |image|
					@post.images.create(img: image)
				end
			end
			flash[:notice]= "Upload post successfully"
		else
			flash[:notice]= "Post can't be blank"
		end

		redirect_to posts_path
	end

	def destroy 
		#puts "PARAM ID: " + params[:id]
		if current_user()
			post = current_user.posts.find_by(id: params[:id])
			if post
				flash[:notice] = "delete successfully"
				post.destroy
			end
		else
			flash[:notice] = "can't delete this post!"
		end
		redirect_to posts_path
	end

	def edit 
		@post = Post.find_by(id: params[:id])
	end

	def update
		@post = Post.find_by(id: params[:post_id])
		current_user = current_user()
		if current_user && validate(current_user, @post) && @post.update({content: params[:post][:content]})
			flash[:notice] = "update successfully"
		else
			flash[:notice] = "can't edit this post!"
		end

		redirect_to posts_path
	end

	private
	def current_user
		if (session[:user_id])
			User.find(session[:user_id])
		else
			nil
		end
	end
	def post_params
		params.require(:post).permit!
	end
	def validate(user, postorcomment)
  		user.id == postorcomment.user_id
  	end
end

