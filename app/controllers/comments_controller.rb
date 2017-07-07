class CommentsController < ApplicationController

	def index
		@comments = Post.find(params[:post_id]).comments.order(:created_at).reverse
		@comment = Comment.new
		@post = Post.find(params[:post_id])
		@user = @post.user
		@current_user = current_user()
	end

	def new
		@comment = Comment.new
	end

	def show
		@comment = Post.find(params[:post_id]).comments.find(params[:id])
	end

	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.new(comment_params)
	    @comment.user_id = current_user.id
	    if (@comment.save)
	    	redirect_to post_comments_path(@post)
	    else
	    	render 'index'
	    end
  	end

  	def edit 
  		@post = Post.find(params[:post_id])
  		@comment = Comment.find(params[:id])
  	end

  	def update
  		@comment = Comment.find(params[:id])
  		@post = @comment.post
  		current_user = current_user()
  		if current_user && validate(current_user, @comment) && @comment.update(comment_params)
  			flash[:notice]= "Update successfully"
  		else
  			flash[:notice]= "May be login or not comment's owner?"
  		end
  		redirect_to post_comments_path(@post)
  	end

  	def destroy
  		current_user = current_user()
  		post = Post.find_by(id: params[:post_id])
  		if current_user
  			comment = Comment.find_by(id: params[:id])
  			if comment && validate(current_user, comment)
  				flash[:notice] = "delete successfully"
  				comment.destroy
  			else
          flash[:notice] = "can't delete this comment!"
        end
  		else
        flash[:notice] = "can't delete this comment!"
  		end
		  redirect_to post_comments_path(post)
  	end


  	private 
  	def comment_params
  		params.require(:comment).permit(:content, :comment_image)
  	end
  	def current_user
  		if (session[:user_id])
  			User.find(session[:user_id])
  		else 
  			nil
  		end
  	end
  	def validate(user, postorcomment)
  		user.id == postorcomment.user_id
  	end
end
