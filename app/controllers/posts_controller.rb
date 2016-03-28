class PostsController < ApplicationController
  before_action :isloggedin
  def new
  	@post = Post.new
  end

  def index
  	@post = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "Success!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.errors.full_messages
  		redirect_to new_post_path
  	end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user

    
    respond_to do |format|
        format.html { redirect_to root_path}
        format.json {}
        format.js {}
    end
  end
  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  private

  def permit_post
  	params.require(:post).permit(:image,:description)
  end
  def isloggedin
    if current_user
    else
      redirect_to new_user_session_path
    end
  end
end
