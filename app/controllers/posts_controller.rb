class PostsController < ApplicationController
	before_action :authenticate_user!

	def index 
		@posts = Post.all
	end

	def show
		
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def create
		@post = Post.new(post_params)

		respond_to do |format|
		  if @post.save
		    format.html{redirect_to @post, notice:'投稿しました'}	
		  else
		    format.html{ render :new }
		  end
		end
	end

	def update
		respond_to do |format|
		  if @post.update(post_params)
		  	format.html{ redirect_to @post, notice:'投稿を編集しました'}
		  else
		  	format.html{ render :edit }
		  end
		end
	end
		

	def destroy
		@post.destroy
		respond_to do |format|
			format.html{ redirect_to posts_url,notice:'投稿が削除されました' }
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title, :body)
	end	

end

end


