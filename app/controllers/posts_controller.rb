class PostsController < ApplicationController
  
  before_filter :authenticate
  
  def index
    @posts = current_user.posts
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      @graph = Koala::Facebook::GraphAPI.new(current_user.token)
      @graph.put_object("me", "feed", :message => @post.body)
      redirect_to posts_url
    else
      render :new
    end
  end
  
end
