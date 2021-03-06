class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_post, only: [:edit, :update, :destroy]
	def index
		@posts = Post.all
		@posts = Post.order("created_at desc")
	end

	  def new
	    @post = current_user.posts.build
	  end

	  def create
	    @post = current_user.posts.build(post_params)

	    if @post.save
	      flash[:success] = "Your post has been created!"
	      redirect_to posts_path
	    else
	      flash[:alert] = "Your new post couldn't be created!  Please check the form."
	      render :new
	    end
	  end

	def show  
	  @post = Post.find(params[:id])
	end  

	def edit  
	  @post = Post.find(params[:id])
	end  

	def update  
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  redirect_to(post_path(@post))
	end  

	def destroy  
	  @post = Post.find(params[:id])
	  @post.destroy
	  redirect_to posts_path
	end  

	private

	  def post_params
	    params.require(:post).permit(:image, :caption)
	  end

	  def set_post
	    @post = Post.find(params[:id])
	  end

		def owned_post  
		  unless current_user == @post.user
		    flash[:alert] = "That post doesn't belong to you!"
		    redirect_to root_path
		  end
		end  

end
