class PostsController < ApplicationController

  def index

    if user_signed_in?
      @list_of_posts = Post.where(user_id:current_user.id)
    else
      redirect_to :controller =>'posts', :action =>'home'
    end
  end

  def new
    @new_post = Post.new
  end

  def create
    @current_post= Post.new(
        params.require(:post).permit(:title, :description, :image, :category)
    )
    @current_post.user_id = current_user.id
    result=@current_post.save()
    if result
      redirect_to :controller =>'posts', :action =>'index'
    else
      redirect_to_back
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: :index
  end

  def edit
    @post = Post.find(params[:id])

  end
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:image, :description, :category))
      redirect_to :controller =>'posts', :action =>'index'
    else
      render 'edit'
    end


  end

    def home
      @list_of_posts=Post.all
      if user_signed_in?
        redirect_to :controller =>'posts', :action =>'index'
      end
      @firstPost=Post.all.order("id DESC").first
    end


  def fashion
    @cat='Fashion'
    @list_of_posts = Post.where('category = ?',@cat)
  end
  def food
    @cat='Food'
    @list_of_posts = Post.where('category = ?',@cat)

  end
  def book
    @cat='Books'
    @list_of_posts = Post.where('category = ?',@cat)
  end
  def toy
    @cat='Toys'
    @list_of_posts = Post.where('category = ?',@cat)

  end

  def show
    id=params[:id]
    @currentPost=Post.find(id)
    @list_of_posts=Post.all.order("id").first(4)
  end




end
