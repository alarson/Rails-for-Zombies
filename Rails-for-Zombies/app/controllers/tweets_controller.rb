class TweetsController < ApplicationController
	before_action :get_tweet, only: [:edit, :update, :destroy]
	before_action :check_auth, :only => [:edit, :update, :destroy]
	def get_tweet
		#@tweet = Tweet.create(params.require(:tweet).permit(:status))
		@tweet = Tweet.find(params[:id])
	end
	def index
		if params[:name]
			@zombie = Zombie.where(name: params[:name]).first
			@tweets = @zombie.tweets
		else
			@tweets = Tweet.all
		end
	end
	def check_auth
		if session[:zombie_id] != @tweet.zombie_id
			flash[:notice] = "sorry go away stop editing this"
			redirect_to(tweets_path)
		end
	end
	def show
		
	end
	def edit
		@tweet = Tweet.find(params[:id])
		
	end
	def update
	end
	def destroy
	end
end