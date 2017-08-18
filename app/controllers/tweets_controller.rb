class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "complete!"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "complete!"
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "complete!"
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
  end
  
  private
  def tweets_params
    params.require(:tweet).permit(:content)
  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
