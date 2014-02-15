class PostsController < ApplicationController
  before_filter :authenticate_user!
  expose_decorated(:posts) { Post.all }
  expose_decorated(:post, attributes: :post_params)
  expose(:tag_cloud) {make_tag}


  def index
  end

  def new
  end

  def edit
  end

  def comments
  end

  def update
    if post.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    post.destroy if current_user.owner? post
    render action: :index
  end

  def show
  end

  def mark_archived
    # post = Post.find params[:id]
    post.archive!
    render action: :index
  end

  def create
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def post_params
    return if %w{mark_archived}.include? action_name
    params.require(:post).permit(:body, :title, :tags)
  end

  def make_tag
   temp_array = [] 	
   	posts.each do |post|
		post.tags_array.each do |tag|
			temp_array << tag
		end
	end

   hash_array = Hash.new(0.0)
	temp_array.each do |tmp|
	 	if !hash_array[tmp].nil?
			hash_array[tmp] = hash_array[tmp] +1 
		end
	end
   
  hash_array.to_a.sort
  end
end
