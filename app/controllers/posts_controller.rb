class PostsController < ApplicationController
  def show
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def index
    @posts = Post.all
  end

  private

    def post_params
    end
end
