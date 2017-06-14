class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
    # tweet_idカラムなのですが、ネストしてurlに@tweet.id（ツイートのid）を記述してあるのでparams[:tweet_id]とするだけで簡単に情報が取ることができます。
    redirect_to "/tweets/#{@comment.tweet.id}"
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end
end
